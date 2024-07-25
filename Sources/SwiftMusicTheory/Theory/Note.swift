public struct Note: Sendable {
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

  func sharp(_ times: Int = 1) -> Note {
    Note(
      name: self.name,
      accidental: Accidental(self.accidental.semitonesDifference + times)
    )
  }

  func flat(_ times: Int = 1) -> Note {
    Note(
      name: self.name,
      accidental: Accidental(self.accidental.semitonesDifference - times)
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
