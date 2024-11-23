public enum Accidental: Sendable {

  case flattened(times: Int = 1)
  case natural
  case sharpened(times: Int = 1)

  public var symbol: String {
    switch self {
    case .flattened(let times) where times == 2:
      "𝄫"
    case .flattened(let times):
      "♭".repeating(times: times)
    case .natural:
      ""
    case .sharpened(let times) where times == 2:
      "𝄪"
    case .sharpened(let times):
      "♯".repeating(times: times)
    }
  }

  public static var flat: Accidental { .flattened() }
  public static var sharp: Accidental { .sharpened() }

  public init(_ semitonesDifference: Int) {
    switch semitonesDifference {
    case 0:
      self = .natural
    case (..<0):
      self = .flattened(times: abs(semitonesDifference))
    default:
      self = .sharpened(times: semitonesDifference)
    }
  }

  public var semitonesDifference: Int {
    switch self {
    case .sharpened(let times):
      times
    case .flattened(let times):
      -times
    case .natural:
      0
    }
  }
}

extension Accidental: Equatable, Comparable, Hashable { }

extension Accidental: CustomStringConvertible {
  public var description: String { symbol }
}
