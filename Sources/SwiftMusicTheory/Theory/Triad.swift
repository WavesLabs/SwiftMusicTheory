public enum Triad: Sendable, CaseIterable {
  case minor
  case major
  case diminished
  case augmented

  public var formula: (Interval, Interval) {
    switch self {
    case .minor: return (.third(.minor), .third(.major))
    case .major: return (.third(.major), .third(.minor))
    case .diminished: return (.third(.minor), .third(.minor))
    case .augmented: return (.third(.major), .third(.major))
    }
  }

  public var shortTitle: String {
    switch self {
    case .minor: "m"
    case .major: "M"
    case .diminished: "d"
    case .augmented: "A"
    }
  }
  
  public var title: String {
    switch self {
    case .major: return ""
    case .minor: return "min"
    case .diminished: return "dim"
    case .augmented: return "aug"
    }
  }
}

extension Triad: Equatable, Hashable { }
