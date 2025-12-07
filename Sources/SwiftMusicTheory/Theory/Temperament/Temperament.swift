import CoreFoundation

public protocol Temperament: Codable, Sendable, Hashable {
  
  var chromaticScale: [Note] { get }
  
  var octaveSubdivisions: Int { get }
  
  func tone(for pitch: Pitch) -> Tone
  
  func tone(at frequency: Double) -> Tone
}

extension Temperament {
  public func tones(fromPitch: Pitch, toPitch: Pitch) -> [Tone] {
    (fromPitch.octave...toPitch.octave)
      .flatMap { octave -> [Pitch] in
        chromaticScale.map { note in
          Pitch(note, octave)
        }
      }
      .filter { $0 >= fromPitch && $0 <= toPitch }
      .map(tone)
  }
  
  public func pitch(from pitch: Pitch, shiftedBySubdivisions: Int) -> Pitch {
    let resultNoteIndex = chromaticScale.firstIndex(where: { $0.isEnharmonic(to: pitch.note) })! + shiftedBySubdivisions
    let note = chromaticScale[(resultNoteIndex + octaveSubdivisions) % octaveSubdivisions]
    let octave = pitch.octave.rawValue + Int(floor(Double(resultNoteIndex) / Double(octaveSubdivisions)))
    
    return Pitch(note, Octave(integerLiteral: octave))
  }
}
