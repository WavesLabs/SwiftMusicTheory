import os

extension Scale {

  public func degree(at interval: Interval) -> Degree? {
    guard let relativeInterval = formulaFromRoot.first(where: { $0.diatonicNumber == interval.diatonicNumber }) else {
      Logger.default.warning("There is no degree at interval: \(interval). Looks, like you trying to get skipped degree in pentatonic or hexatonic")
      return nil
    }

    let semitonesDiff = interval.octaveAsRootSemitones - relativeInterval.semitonesCount()
    return Degree(
      diatonicNumber: relativeInterval.diatonicNumber,
      accidental: Accidental(semitonesDiff)
    )
  }

  /// Calculates the scale degrees by comparing the current scale to the given scale.
  /// For example, for a minor scale compared to a major scale, it returns [1, 2, b3, 4, 5, b6, b7].
  ///
  /// - Parameter comparativeScale: The scale to compare against. Default is `.diatonic` major scale.
  /// - Returns: An array of `Degree` instances representing the scale degrees.
  public func degrees(comparedTo comparativeScale: Scale = .diatonic) -> [Degree] {
    formulaFromRoot.compactMap { interval -> Scale.Degree? in
      guard let degree = comparativeScale.degree(at: interval) else {
        Logger.default.warning("There is no relative degree for: \(interval) in comparative scale: \(comparativeScale.name))")
        return nil
      }

      return degree
    }
  }
}

public extension Scale {
  struct Degree: Hashable {
    public enum Number: Int, CaseIterable {
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

    fileprivate init(diatonicNumber: Int, accidental: Accidental) {
      self.init(Number(rawValue: diatonicNumber)!, accidental)
    }

    fileprivate init(_ number: Number, _ accidental: Accidental) {
      self.number = number
      self.accidental = accidental
    }
  }
}

public extension Scale.Degree {
  static func tonic() -> Self { .init(.tonic, .natural) }
  static func second(_ accidental: Accidental = .natural) -> Self { .init(.second, accidental) }
  static func third(_ accidental: Accidental = .natural) -> Self { .init(.third, accidental) }
  static func fourth(_ accidental: Accidental = .natural) -> Self { .init(.fourth, accidental) }
  static func fifth(_ accidental: Accidental = .natural) -> Self { .init(.fifth, accidental) }
  static func sixth(_ accidental: Accidental = .natural) -> Self { .init(.sixth, accidental) }
  static func seventh(_ accidental: Accidental = .natural) -> Self { .init(.seventh, accidental) }
}

fileprivate extension Scale.Degree.Number {

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

extension Scale.Degree: CustomStringConvertible {

  public var arabicNotation: String {  accidental.symbol + String(number.rawValue) }
  public var romanicNotation: String { accidental.symbol + number.romanicNumber }

  public var description: String { arabicNotation }
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
