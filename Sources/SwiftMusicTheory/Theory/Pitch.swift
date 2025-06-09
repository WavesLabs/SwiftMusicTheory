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
    lhs.centsFromC0 < rhs.centsFromC0
  }
  
  var semitonesFromC0: Int {
    let semitonesInOctave = octave.rawValue * Interval.octave().semitonesCount()
    let semitonesWithinOctave = note.semitonesNormalized
    return semitonesInOctave + semitonesWithinOctave
  }
  
  var centsFromC0: Int {
    return semitonesFromC0 * 100 + cents
  }
}

extension Pitch: CustomDebugStringConvertible {
  public var debugDescription: String {
    scientificNotation
  }
  
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
