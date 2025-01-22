import CoreFoundation

public struct EqualTemperament: Temperament {
  
  public let chromaticScale: [Note] = [.c, .d.flat(), .d, .e.flat(), .e, .f, .g.flat(), .g, .a.flat(), .a, .b.flat(), .b]
  
  public let distanceReduction: Double
  
  public let relativeFrequency: Double
  public let relativePitch: Pitch
  public let octaveSubdivisions: Int
  
  public init(
    relativeFrequency: Double = 440,
    relativePitch: Pitch = Pitch(.a, 4),
    octaveSubdivisions: Int = Interval.octave().semitonesCount()
  ) {
    self.relativeFrequency = relativeFrequency
    self.relativePitch = relativePitch
    self.octaveSubdivisions = octaveSubdivisions
    self.distanceReduction = pow(2, -(1.0 / Double(octaveSubdivisions)))
  }
  
  public func frequency(for pitch: Pitch) -> TemperedPitch {
    let octavesDistance = Double(pitch.octave.rawValue - relativePitch.octave.rawValue)
    let notesDistance = Double(pitch.note.semitonesNormalized - relativePitch.note.semitonesNormalized) / Double(octaveSubdivisions)
    let centsDistance = Double(pitch.cents - relativePitch.cents) / Double(octaveSubdivisions * 100)
    let frequency = relativeFrequency * pow(2, octavesDistance + notesDistance + centsDistance)
    return TemperedPitch(pitch: pitch, frequency: frequency)
  }
  
  public func pitch(at frequency: Double) -> TemperedPitch {
    let distance = Double(octaveSubdivisions) * log2(frequency / relativeFrequency)
    
    let semitonesDistance = round(distance)
    
    let octavesDistance = ((Double(relativePitch.note.semitonesNormalized) + semitonesDistance) / Double(octaveSubdivisions)).rounded(.down)
    let notesDistance = relativePitch.note.semitonesNormalized + Int(semitonesDistance) - Int(octavesDistance) * octaveSubdivisions
    let centsDistance = Int(((distance - semitonesDistance) * 100).rounded()) + relativePitch.cents
    
    let resultingNote = chromaticScale[notesDistance % octaveSubdivisions]
    let resultingOctave = relativePitch.octave.rawValue + Int(octavesDistance)
    
    let pitch = Pitch(resultingNote, Octave(integerLiteral: resultingOctave), cents: centsDistance)
    return TemperedPitch(pitch: pitch, frequency: frequency)
  }
}

public extension EqualTemperament {
  static let _12ET440 = EqualTemperament()
}
