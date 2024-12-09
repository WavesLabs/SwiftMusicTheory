public enum Octave: Int, CaseIterable, Sendable {
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

extension Octave: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self = Octave(rawValue: value) ?? .subcontra
  }
}
