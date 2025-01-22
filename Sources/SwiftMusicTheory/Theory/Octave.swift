public enum Octave: Int, Sendable {
  
  case subcontra = 0
  case contra = 1
  case great
  case small
  case oneLine
  case twoLine
  case threeLine
  case fourLine
  case fiveLine
  case sixLine
}

extension Octave: CaseIterable {
  public var largest: Octave {
    Octave.allCases.last ?? .subcontra
  }
  
  public var smallest: Octave {
    Octave.allCases.first ?? .subcontra
  }
}

extension Octave: Comparable {
  
  public static func < (lhs: Octave, rhs: Octave) -> Bool {
    lhs.rawValue < rhs.rawValue
  }
}

extension Octave: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self = Octave(rawValue: value) ?? .subcontra
  }
}
