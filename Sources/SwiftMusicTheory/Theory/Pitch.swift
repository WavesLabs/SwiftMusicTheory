import CoreFoundation
import Foundation

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
  // I think create TemperedPitch is a good idea
//  public func transposed(by interval: Interval) -> Pitch {
//
//  }
}

public extension Note {
  func octave(_ octave: Octave) -> Pitch {
    Pitch(self, octave)
  }
}

public extension Pitch {
  init?(_ string: String) {
    let pattern = "^([A-Ga-g])([#b♯♭]*)((-)?\\d+)$"
    
    guard
      let regex = try? NSRegularExpression(pattern: pattern),
      let match = regex.firstMatch(in: string, range: NSRange(string.startIndex..., in: string))
    else { return nil }
    
    guard
      let nameRange = Range(match.range(at: 1), in: string),
      let noteName = Note.Name(String(string[nameRange]))
    else { return nil }
    
    let accidental: Accidental
    if let accRange = Range(match.range(at: 2), in: string) {
      let accString = String(string[accRange])
      let sharps = accString.filter { $0 == "#" || $0 == "♯" }.count
      let flats = accString.filter { $0 == "b" || $0 == "♭" }.count
      accidental = Accidental(sharps - flats)
    } else {
      accidental = .natural
    }
    
    guard
      let octaveRange = Range(match.range(at: 3), in: string),
      let octaveInt = Int(string[octaveRange])
    else { return nil }
    
    self.init(Note(name: noteName, accidental: accidental), Octave(integerLiteral: octaveInt))
  }
}
