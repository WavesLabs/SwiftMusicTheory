public struct KeyboardInstrument<Intonation: Temperament>: MusicalInstrument {
  public var temperament: Intonation
  
  public let tonesRange: ClosedRange<Tone>
  
  public init(temperament: Intonation, tonesRange: ClosedRange<Tone>) {
    self.temperament = temperament
    self.tonesRange = tonesRange
  }
  
  public func pitch(at midiNote: MIDINote) -> Pitch {
    return Pitch(
      temperament.chromaticScale[Int(midiNote) % temperament.octaveSubdivisions],
      // MIDI counts semitones above C-1 (note 0) so we add one octave
      Octave(integerLiteral: Int(midiNote) / temperament.octaveSubdivisions - 1)
    )
  }
}
