import CoreFoundation

public struct Tone: Codable, Hashable, Sendable {
  
  public let pitch: Pitch
  public let frequency: Double
  public let log2Frequency: Double
  
  public init(pitch: Pitch, frequency: Double) {
    self.pitch = pitch
    self.frequency = frequency
    self.log2Frequency = log2(frequency)
  }
}

extension Tone: Comparable {
  public static func < (lhs: Tone, rhs: Tone) -> Bool {
    lhs.log2Frequency < rhs.log2Frequency
  }
}
