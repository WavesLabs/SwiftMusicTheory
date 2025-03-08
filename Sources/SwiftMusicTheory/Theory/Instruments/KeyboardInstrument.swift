public struct KeyboardInstrument<Intonation: Temperament>: MusicalInstrument {
  public var temperament: Intonation
  
  public let tonesRange: ClosedRange<Tone>
  
  public init(temperament: Intonation, tonesRange: ClosedRange<Tone>) {
    self.temperament = temperament
    self.tonesRange = tonesRange
  }
  
  public func pitch(at midiNote: MIDINote) -> Pitch {
    return Pitch(
      temperament.chromaticScale[midiNote % temperament.octaveSubdivisions],
      Octave(integerLiteral: midiNote / temperament.octaveSubdivisions)
    )
  }
}
