public struct Note: Sendable, Codable {
  public enum Name: Int, Sendable {
    case c
    case d
    case e
    case f
    case g
    case a
    case b
  }

  public let name: Name
  public let accidental: Accidental

  public init(name: Note.Name, accidental: Accidental = .natural) {
    self.name = name
    self.accidental = accidental
  }
}

public extension Note.Name {
  init?(_ string: String) {
    switch string.lowercased() {
    case "c": self = .c
    case "d": self = .d
    case "e": self = .e
    case "f": self = .f
    case "g": self = .g
    case "a": self = .a
    case "b": self = .b
    default: return nil
    }
  }
}

public extension Note {
  static let c = Note(name: .c)
  static let d = Note(name: .d)
  static let e = Note(name: .e)
  static let f = Note(name: .f)
  static let g = Note(name: .g)
  static let a = Note(name: .a)
  static let b = Note(name: .b)

  func diatonicEnharmonism(shifted: Int) -> Note {
    guard shifted != 0 else { return self }

    var result = self
    for _ in 0..<abs(shifted) {
      if shifted > 0 {
        result = result + .second(.diminished())
      } else {
        result = result - .second(.diminished())
      }
    }
    return result
  }

  func sharp(_ sharpsAmount: Int = 1) -> Note {
    Note(
      name: self.name,
      accidental: Accidental(self.accidental.semitonesDifference + sharpsAmount)
    )
  }

  func flat(_ flatsAmount: Int = 1) -> Note {
    Note(
      name: self.name,
      accidental: Accidental(self.accidental.semitonesDifference - flatsAmount)
    )
  }
}

extension Note: CustomStringConvertible {
  public var description: String {
    notation
  }

  public var notation: String {
    name.title + accidental.symbol
  }
}

fileprivate extension Note.Name {

  var title: String {
    switch self {
    case .c: return "C"
    case .d: return "D"
    case .e: return "E"
    case .f: return "F"
    case .g: return "G"
    case .a: return "A"
    case .b: return "B"
    }
  }
}

extension Note: Equatable, Hashable { }

extension Note.Name: Codable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(title)
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let title = try container.decode(String.self)
    switch title.lowercased() {
    case "c": self = .c
    case "d": self = .d
    case "e": self = .e
    case "f": self = .f
    case "g": self = .g
    case "a": self = .a
    case "b": self = .b
    default:
      throw DecodingError.dataCorruptedError(
        in: container,
        debugDescription: "Invalid note name: \(title)"
      )
    }
  }
}
