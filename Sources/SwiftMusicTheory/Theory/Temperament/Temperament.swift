import CoreFoundation

public protocol Temperament: Sendable {
  
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
}
