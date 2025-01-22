import CoreFoundation

public struct Tone {
  public let pitch: Pitch
  public let frequency: Double
  public let log2Frequency: Double
  
  public init(pitch: Pitch, frequency: Double) {
    self.pitch = pitch
    self.frequency = frequency
    self.log2Frequency = log2(frequency)
  }
}
