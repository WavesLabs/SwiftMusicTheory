public enum Octave: Int, CaseIterable, Sendable, Codable {
  
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

extension Octave {
  public static var largest: Octave {
    Octave.allCases.last ?? .subcontra
  }
  
  public static var smallest: Octave {
    Octave.allCases.first ?? .subcontra
  }
}

extension Octave: Strideable {
  public func distance(to other: Octave) -> Int {
    other.rawValue - rawValue
  }
  
  public func advanced(by n: Int) -> Octave {
    Octave(rawValue: rawValue + n) ?? ((rawValue + n > Octave.allCases.count) ? .largest : .smallest)
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
