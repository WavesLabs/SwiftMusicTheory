import CoreFoundation

public struct Pitch: Sendable, Codable {

  public let note: Note
  public fileprivate(set) var octave: Octave
  public let cents: Int

  public init(
    _ note: Note,
    _ octave: Octave,
    cents: Int = 0
  ) {
    self.note = note
    self.octave = octave
    self.cents = cents
  }
}

extension Pitch: Hashable { }

extension Pitch: Comparable {
  public static func < (lhs: Pitch, rhs: Pitch) -> Bool {
    lhs.absoluteCents < rhs.absoluteCents
  }
  
  var absoluteCents: Int {
    let semitonesInOctave = octave.rawValue * Interval.octave().semitonesCount()
    let semitonesWithinOctave = note.semitonesNormalized
    let totalSemitones = semitonesInOctave + semitonesWithinOctave
    return totalSemitones * 100 + cents
  }
}

extension Pitch {
  public var scientificNotation: String {
    String(note.notation) + String(octave.rawValue)
  }

  // TODO: Implement me
//  public func transposed(by interval: Interval) -> Pitch {
//
//  }
}

public extension Note {
  func octave(_ octave: Octave) -> Pitch {
    Pitch(self, octave)
  }
}
