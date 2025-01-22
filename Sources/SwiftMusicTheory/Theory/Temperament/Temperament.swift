import CoreFoundation

public protocol Temperament: Sendable {
  
  var chromaticScale: [Note] { get }
  
  var octaveSubdivisions: Int { get }
  
  func tone(for pitch: Pitch) -> Tone
  
  func tone(at frequency: Double) -> Tone
}
