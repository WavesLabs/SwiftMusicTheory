public struct StringInstrument: Sendable {

  public typealias Fret = Int
  public typealias String = Int
  public typealias Tuning = [Pitch]

  // MARK: Config
  let fretsCount: Int
  let positionMarkers = [0, 3, 5, 7, 9]
  let temperament: Temperament
  
  let tuning: Tuning

  public init(
    tuning: Tuning = .standart6String,
    temperament: Temperament = EqualTemperament._12ET440,
    fretsCount: Int = 24
  ) {
    self.tuning = tuning
    self.fretsCount = fretsCount
    self.temperament = temperament
  }
  
  // TODO: Move to Pitch structure
  public func pitch(for string: StringInstrument.String, fret: Fret) -> Pitch {
    let stringPitch = tuning[string - 1]
    let note = temperament.chromaticScale[(stringPitch.note.semitonesNormalized + fret) % temperament.octaveSubdivisions]
    let octave = stringPitch.octave.rawValue + (stringPitch.note.semitonesNormalized + fret) / temperament.octaveSubdivisions
    return Pitch(note, Octave(integerLiteral: octave))
  }
}

public extension StringInstrument.Tuning {
  static var standart6String: StringInstrument.Tuning {
    [
      Note.e.octave(.oneLine),
      Note.b.octave(.small),
      Note.g.octave(.small),
      Note.d.octave(.small),
      Note.a.octave(.great),
      Note.e.octave(.great)
    ]
  }
  
  static var standart7String: StringInstrument.Tuning {
    [
      Note.e.octave(.oneLine),
      Note.b.octave(.small),
      Note.g.octave(.small),
      Note.d.octave(.small),
      Note.a.octave(.great),
      Note.e.octave(.great),
      Note.b.octave(.contra),
    ]
  }
  
  static var standart8String: StringInstrument.Tuning {
    [
      Note.e.octave(.oneLine),
      Note.b.octave(.small),
      Note.g.octave(.small),
      Note.d.octave(.small),
      Note.a.octave(.great),
      Note.e.octave(.great),
      Note.b.octave(.contra),
      Note.f.sharp().octave(.contra),
    ]
  }

  static var dropD: StringInstrument.Tuning {
    var dropD = standart6String
    dropD[5] = Note.d.octave(.great)
    return dropD
  }
}
