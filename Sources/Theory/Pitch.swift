import CoreFoundation

public struct Pitch {

  public let note: Note
  public fileprivate(set) var octave: Octave
  public var cents: Int

  public init(
    note: Note,
    octave: Octave,
    cents: Int = 0
  ) {
    self.note = note
    self.octave = octave
    self.cents = cents
  }

  public func transposed(by interval: Interval) -> Pitch {
    fatalError()
  }
}

extension Pitch: Hashable { }

extension Pitch {
  public var scientificNotation: String {
    String(note.notation) + String(octave.rawValue)
  }

  public static let distanceReduction: CGFloat = pow(2, -(1.0 / 12))
}

public extension Note {
  func octave(_ octave: Octave) -> Pitch {
    Pitch(note: self, octave: octave)
  }
}
