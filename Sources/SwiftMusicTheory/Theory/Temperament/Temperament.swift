import CoreFoundation

public protocol Temperament {
  func frequency(for pitch: Pitch) -> Double
  
  func pitch(at frequency: Double) -> Pitch
}

