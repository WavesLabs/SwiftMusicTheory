public protocol MusicalInstrument: Codable, Sendable, Hashable {
  
  associatedtype Position
  associatedtype Temperation: Temperament
  
  var temperament: Temperation { get }
  
  var tonesRange: ClosedRange<Tone> { get }
  
  func pitch(at: Position) -> Pitch
}
