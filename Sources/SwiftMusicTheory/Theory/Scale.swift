import os

public extension Scale {
  struct Formula: Sendable {
    public struct Step: Sendable, Equatable {
      public init(_ interval: Interval, _ modeTitle: String) {
        self.interval = interval
        self.modeTitle = modeTitle
      }
      
      fileprivate let interval: Interval
      fileprivate let modeTitle: String
    }
    
    fileprivate let steps: [Step]
    fileprivate let intervalsFromRoot: [Interval]
    
    public init(_ steps: [Step]) {
      let intervals = steps.map(\.interval)
      
      if !intervals.isOctaveWide {
        logWarning("Scale must be an octave wide: \(intervals)")
      }
      
      self.intervalsFromRoot = intervals
        .dropLast()
        .enumerated()
        .reduce(into: [Interval.unison()]) { formulaFromRoot, interval in
          let nextDegree = formulaFromRoot[interval.offset] + interval.element
          formulaFromRoot.append(nextDegree)
        }
      self.steps = steps
    }
  }
}

public struct Scale: Sendable {

  public struct Degree: Sendable {
    
    /// Function of the degree relative to the diatonic
    public let function: Function
    
    /// Title of the mode, that can be build on the current degree
    public let modeTitle: String
    
    /// Interval of the degree relative to the tonic of the scale
    public let intervalFromRoot: Interval
    
    /// Triad placed on the current scale degree
    public let triad: Triad?
  }

  public let name: String
  public let degrees: [Degree]
  public let intervals: [Interval]
  fileprivate let formula: Formula
  
  public var triads: [Triad?] { degrees.map(\.triad) }
  public var functions: [Function] { degrees.map(\.function) }

  public init(name: String, formula: Formula) {
    self.name = name
    self.formula = formula
    
    let intervals = formula.steps.map(\.interval)
    let degrees = formula.steps
      .enumerated()
      .map { index, step in
        let intervalFromRoot = formula.intervalsFromRoot[index]
        return Degree(
          function: Formula.diatonic.chromaticFunction(at: intervalFromRoot)!,
          modeTitle: step.modeTitle,
          intervalFromRoot: intervalFromRoot,
          triad: intervals.triad(for: index)
        )
      }
    
    self.degrees = degrees
    self.intervals = intervals
  }
}

public extension Scale {
  
  /// Shift scale by certain amount of steps
  ///
  /// - Parameter shift: Steps to shift
  /// - Returns: Shifted scale.
  /// - Note: For example, diatonic.shifted(at: 5) returns minor scale
  func shifted(at shift: Int) -> Scale {
    Scale(name: name, formula: Formula(formula.steps.shifted(by: shift, in: .left)))
  }
  
  /// Scale build on certain function
  ///
  /// - Parameter function: The degree to build scale from
  /// - Returns: Scale started from the degree of the function. Nil, in case when scale does not contain specified function.
  func scale(placedOn function: Function) -> Scale? {
    guard let functionIndex = functions.firstIndex(of: function) else {
      logWarning("There is no \(function) in \(self.name). Functions: \(functions)")
      return nil
    }
    
    return shifted(at: functionIndex)
  }
  
  /// Retruns which Function could be in the scale on the given interval
  ///
  /// For example, if you are willing to know, what Function could be in the Major Diatonic on minor third, it will return b3, even if there are no actually b3 in the Major scale
  /// - Parameter interval: Interval to compare agains
  func chromaticFunction(at interval: Interval) -> Scale.Function? {
    formula.chromaticFunction(at: interval)
  }
  
  /// Calculates the scale degrees by comparing the current scale to the given scale.
  /// For example, for a minor scale compared to a major scale, it returns [1, 2, b3, 4, 5, b6, b7].
  ///
  /// - Parameter comparativeScale: The scale to compare against. Default is `.diatonic` major scale.
  /// - Returns: An array of `Degree` instances representing the scale degrees.
  func functions(comparedTo comparative: Scale = .diatonic) -> [Scale.Function] {
    formula.intervalsFromRoot
      .compactMap { interval -> Scale.Function? in
        guard let degree = comparative.chromaticFunction(at: interval) else {
          logWarning("There is no relative degree for: \(interval) in comparative scale: \(comparative))")
          return nil
        }
        
        return degree
      }
  }
}

extension Scale: Equatable {
  public static func == (lhs: Scale, rhs: Scale) -> Bool {
    lhs.formula.steps == rhs.formula.steps
  }
}

fileprivate extension Array where Element == Interval {
  var isOctaveWide: Bool {
    reduce(into: .unison(.perfect), { $0 += $1 }) == .octave(.perfect)
  }

  func triad(for degree: Int) -> Triad? {
    let intervals = (
      self[cycled: degree] + self[cycled: degree + 1],
      self[cycled: degree + 2] + self[cycled: degree + 3]
    )

    return Triad.allCases.first {
      $0.formula == intervals
    }
  }
}

fileprivate extension Scale.Formula {
  func chromaticFunction(at interval: Interval) -> Scale.Function? {
    guard let relativeInterval = intervalsFromRoot
      .first(where: { $0.diatonicIndexNormilized == interval.diatonicIndexNormilized }) else {
      logWarning("There is no degree at interval: \(interval). Looks, like you trying to get skipped degree in pentatonic or hexatonic")
      return nil
    }

    let semitonesDiff = interval.octaveAsRootSemitones - relativeInterval.semitonesCount()
    return Scale.Function(
      diatonicIndexNormilized: relativeInterval.diatonicIndexNormilized,
      accidental: Accidental(semitonesDiff)
    )
  }
}

fileprivate extension Interval {

  // To make sure the octave degree is considered as the root
  var octaveAsRootSemitones: Int {
    if case .perfect(let perfect, _, _) = self, case .octave = perfect {
      return semitonesCount() - Interval.octave().semitonesCount()
    } else {
      return semitonesCount()
    }
  }
}

public extension Scale {
  struct Function: Sendable, Hashable {
    public enum Number: Int, Sendable, CaseIterable {
      case tonic = 1
      case second
      case third
      case fourth
      case fifth
      case sixth
      case seventh
    }

    public let number: Number
    public let accidental: Accidental

    fileprivate init(diatonicIndexNormilized: Int, accidental: Accidental) {
      self.init(Number(rawValue: diatonicIndexNormilized)!, accidental)
    }

    fileprivate init(_ number: Number, _ accidental: Accidental) {
      self.number = number
      self.accidental = accidental
    }
  }
}

public extension Scale.Function {
  static func tonic() -> Self { .init(.tonic, .natural) }
  static func second(_ accidental: Accidental = .natural) -> Self { .init(.second, accidental) }
  static func third(_ accidental: Accidental = .natural) -> Self { .init(.third, accidental) }
  static func fourth(_ accidental: Accidental = .natural) -> Self { .init(.fourth, accidental) }
  static func fifth(_ accidental: Accidental = .natural) -> Self { .init(.fifth, accidental) }
  static func sixth(_ accidental: Accidental = .natural) -> Self { .init(.sixth, accidental) }
  static func seventh(_ accidental: Accidental = .natural) -> Self { .init(.seventh, accidental) }
}

fileprivate extension Scale.Function.Number {

  var romanicNumber: String {
    switch self {
    case .tonic: "I"
    case .second: "II"
    case .third: "III"
    case .fourth: "IV"
    case .fifth: "V"
    case .sixth: "VI"
    case .seventh: "VII"
    }
  }
}

extension Scale.Function: CustomStringConvertible {

  public var arabicNotation: String {  accidental.symbol + String(number.rawValue) }
  public var romanicNotation: String { accidental.symbol + number.romanicNumber }

  public var description: String { arabicNotation }
}

extension Scale.Degree {
  public var functionTitle: String {
    var result = function.romanicNotation
    switch triad {
    case .augmented:
      result += "+"
      fallthrough
    case .major:
      result.uppercase()

    case .diminished:
      result += "°"
      fallthrough
    case .minor:
      result.lowercase()
    case nil:
      return ""
    }
    return result
  }
}
