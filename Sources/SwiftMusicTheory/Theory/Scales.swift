public extension Scale.Formula {
  static let diatonic = Scale.Formula([
    Scale.Formula.Step(.second(.major), "Major"),
    Scale.Formula.Step(.second(.major), "Dorian"),
    Scale.Formula.Step(.second(.minor), "Phrygian"),
    Scale.Formula.Step(.second(.major), "Lydian"),
    Scale.Formula.Step(.second(.major), "Mixolydian"),
    Scale.Formula.Step(.second(.major), "Minor"),
    Scale.Formula.Step(.second(.minor), "Locrian")
  ])
}

public extension Scale {
  
  static let diatonic: Scale = Scale(name: "Diatonic", formula: .diatonic)
  
  static let pentatonic: Scale = Scale(
    name: "Pentatonic",
    formula: Formula([
      Formula.Step(.second(.major), "Major"),
      Formula.Step(.second(.major), "Blues major"),
      Formula.Step(.third(.minor), "Suspended"),
      Formula.Step(.second(.major), "Minor"),
      Formula.Step(.third(.minor), "Blues minor"),
    ])
  )
  
  static let wholeTone: Scale = Scale(
    name: "Whole Tone",
    formula: Formula([
      Formula.Step(.second(.major), "Whole tone"),
      Formula.Step(.second(.major), "Whole tone"),
      Formula.Step(.second(.major), "Whole tone"),
      Formula.Step(.second(.major), "Whole tone"),
      Formula.Step(.second(.major), "Whole tone"),
      Formula.Step(.third(.diminished()), "Whole tone"),
    ])
  )
  
  static let diminished: Scale = Scale(
    name: "Diminished",
    formula: Formula([
      Formula.Step(.second(.major), "Dim"),
      Formula.Step(.second(.minor), "Inv. dim"),
      Formula.Step(.second(.major), "Dim"),
      Formula.Step(.unison(.augmented()), "Inv. dim"),
      Formula.Step(.second(.major), "Dim"),
      Formula.Step(.second(.minor), "Inv. dim"),
      Formula.Step(.second(.major), "Dim"),
      Formula.Step(.second(.minor), "Inv. dim"),
    ])
  )
  
  static let augmented: Scale = Scale(
    name: "Augmented",
    formula: Formula([
      Formula.Step(.second(.augmented()), "Augd"),
      Formula.Step(.second(.minor), "Inv. aug"),
      Formula.Step(.second(.augmented()), "Aug"),
      Formula.Step(.second(.minor), "Inv. aug"),
      Formula.Step(.second(.augmented()), "Aug"),
      Formula.Step(.second(.minor), "Inv. aug"),
    ])
  )
  
  static let harmonicMajor: Scale = Scale(
    name: "Harmonic Major",
    formula: Formula([
      Formula.Step(.second(.major), "Harm maj"),
      Formula.Step(.second(.major), "Dor \(Accidental.flat)5"),
      Formula.Step(.second(.minor), "Phr \(Accidental.flat)4"),
      Formula.Step(.second(.major), "Lyd \(Accidental.flat)3"),
      Formula.Step(.second(.minor), "Mixolyd \(Accidental.flat)2"),
      Formula.Step(.second(.augmented()), "Lyd aug \(Accidental.sharp)2"),
      Formula.Step(.second(.minor), "Loc \(Accidental.flattened(times: 2))7")
    ])
  )
    
  static let doubleHarmonicMajor: Scale = Scale(
    name: "Double Harmonic Major",
    formula: Formula([
      Formula.Step(.second(.minor), "Double Harm maj"),
      Formula.Step(.second(.augmented()), "Lyd \(Accidental.sharp)2 \(Accidental.sharp)5"),
      Formula.Step(.second(.minor), "Ultraphrygian"),
      Formula.Step(.second(.major), "Hungarian"),
      Formula.Step(.second(.minor), "Oriental"),
      Formula.Step(.second(.augmented()), "Ionian \(Accidental.sharp)2 \(Accidental.sharp)5"),
      Formula.Step(.second(.minor), "Loc \(Accidental.flattened(times: 2))3 \(Accidental.flattened(times: 2))7")
    ])
  )
  
  static let harmonicMinor: Scale = Scale(
    name: "Harmonic Minor",
    formula: Formula([
      Scale.Formula.Step(.second(.major), "Harm minor"),
      Scale.Formula.Step(.second(.minor), "Locrian \(Accidental.sharp)6"),
      Scale.Formula.Step(.second(.major), "Aug major"),
      Scale.Formula.Step(.second(.major), "Dorian \(Accidental.sharp)4"),
      Scale.Formula.Step(.second(.minor), "Phr dominant"),
      Scale.Formula.Step(.second(.augmented()), "Lydian \(Accidental.sharp)2"),
      Scale.Formula.Step(.second(.minor), "Super Loc \(Accidental.flattened(times: 2))7"),
    ])
  )
  
  static let melodicMinor: Scale = Scale(
    name: "Melodic Minor",
    formula: Formula([
      Scale.Formula.Step(.second(.major), "Jazz Minor"),
      Scale.Formula.Step(.second(.minor), "Dorian \(Accidental.flat)2"),
      Scale.Formula.Step(.second(.major), "Lyd Aug"),
      Scale.Formula.Step(.second(.major), "Lyd dom"),
      Scale.Formula.Step(.second(.major), "Aeolian dom"),
      Scale.Formula.Step(.second(.major), "Half-Dim"),
      Scale.Formula.Step(.second(.minor), "Super Loc"),
    ])
  )
}
