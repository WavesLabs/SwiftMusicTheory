import CoreFoundation

public protocol Temperament: Sendable {
  
  var chromaticScale: [Note] { get }
  
  var octaveSubdivisions: Int { get }
  
  func frequency(for pitch: Pitch) -> TemperedPitch
  
  func pitch(at frequency: Double) -> TemperedPitch
}

public struct TemperedPitch {
  public let pitch: Pitch
  public let frequency: Double
  public let log2Frequency: Double
  
  public init(pitch: Pitch, frequency: Double) {
    self.pitch = pitch
    self.frequency = frequency
    self.log2Frequency = log2(frequency)
  }
}
