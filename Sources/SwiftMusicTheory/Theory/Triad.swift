public enum Triad: Sendable, CaseIterable {
  case minor
  case major
  case diminished
  case augmented

  public var formula: (Int, Int) {
    let majorThird = Interval.third(.major).semitonesCount()
    let minorThird = Interval.third(.minor).semitonesCount()
    switch self {
    case .minor: return (minorThird, majorThird)
    case .major: return (majorThird, minorThird)
    case .diminished: return (minorThird, minorThird)
    case .augmented: return (majorThird, majorThird)
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
