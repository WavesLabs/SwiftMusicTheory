public extension Scale {

  static let diatonic: Scale = Scale(
    name: "Diatonic",
    steps: [
      Step(.second(.major), "Major"),
      Step(.second(.major), "Dorian"),
      Step(.second(.minor), "Phrygian"),
      Step(.second(.major), "Lydian"),
      Step(.second(.major), "Mixolydian"),
      Step(.second(.major), "Minor"),
      Step(.second(.minor), "Locrian")
    ]
  )

  static let pentatonic: Scale = Scale(
    name: "Major pentatonic",
    steps: [
      Step(.second(.major), "Major"),
      Step(.second(.major), "Blues major"),
      Step(.third(.minor), "Suspended"),
      Step(.second(.major), "Minor"),
      Step(.third(.minor), "Blues minor"),
  ])

  static let wholeTone: Scale = Scale(
    name: "Whole tone",
    steps: [
      Step(.second(.major), "Whole tone"),
      Step(.second(.major), "Whole tone"),
      Step(.second(.major), "Whole tone"),
      Step(.second(.major), "Whole tone"),
      Step(.second(.major), "Whole tone"),
      Step(.third(.diminished()), "Whole tone"),
  ])

  static let diminished: Scale = Scale(
    name: "Diminished",
    steps: [
      Step(.second(.major), "Diminished"),
      Step(.second(.minor), "Inv. diminished"),
      Step(.second(.major), "Diminished"),
      Step(.unison(.augmented()), "Inv. diminished"),
      Step(.second(.major), "Diminished"),
      Step(.second(.minor), "Inv. diminished"),
      Step(.second(.major), "Diminished"),
      Step(.second(.minor), "Inv. diminished"),
    ]
  )

  static let augmented: Scale = Scale(
    name: "Augmented",
    steps: [
        Step(.second(.augmented()), "Augmented"),
        Step(.second(.minor), "Inv. augmented"),
        Step(.second(.augmented()), "Augmented"),
        Step(.second(.minor), "Inv. augmented"),
        Step(.second(.augmented()), "Augmented"),
        Step(.second(.minor), "Inv. augmented"),
    ]
  )

  static let harmonicMajor: Scale = Scale(
    name: "Harmonic major",
    steps: [
      Step(.second(.major), "Harm maj"),
      Step(.second(.major), "Dor \(Accidental.flat)5"),
      Step(.second(.minor), "Phr \(Accidental.flat)4"),
      Step(.second(.major), "Lyd \(Accidental.flat)3"),
      Step(.second(.minor), "Mixolyd \(Accidental.flat)2"),
      Step(.second(.augmented()), "Lyd augm \(Accidental.sharp)2"),
      Step(.second(.minor), "Loc \(Accidental.flattened(times: 2))7")
    ]
  )

  // TODO: add doubleHarmonicMajor, harmonicMinor, melodicMinor
}
