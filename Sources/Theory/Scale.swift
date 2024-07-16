import os

public struct Scale: Sendable {

  public struct Step: Sendable {
    public init(_ interval: Interval, _ mode: String) {
      self.interval = interval
      self.mode = mode
    }
    
    public let interval: Interval
    public let mode: String
  }

  public let name: String
  public let modes: [String]
  public let formula: [Interval]
  public let formulaFromRoot: [Interval]
  public let triads: [Triad]
  public let degreesIndecies: ClosedRange<Int>

  private let steps: [Step]

  public init(name: String, steps: [Step]) {
    let formula = steps.map(\.interval)

    if !formula.isOctaveWide {
      Logger.default.error("\(name) scale must be an octave wide: \(formula)")
    }

    self.name = name
    self.steps = steps
    self.modes = steps.map(\.mode)
    self.formula = formula
    self.formulaFromRoot = formula
      .dropLast()
      .enumerated()
      .reduce(into: [.unison()]) { formulaFromRoot, interval in
        let nextDegree = formulaFromRoot[interval.offset] + interval.element
        formulaFromRoot.append(nextDegree)
      }

    self.triads = (0..<steps.count).compactMap { formula.triad(for: $0) }
    self.degreesIndecies = (1...steps.count)
  }
}

public extension Scale {
  func mode(at degree: Int) -> Scale {
    Scale(name: name, steps: steps.shifted(by: degree - 1, in: .left))
  }
}

extension Scale: Equatable {
  public static func == (lhs: Scale, rhs: Scale) -> Bool {
    lhs.formulaFromRoot == rhs.formulaFromRoot
  }
}

// TODO: Move to scale
public extension Array where Element == Interval {
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
