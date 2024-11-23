extension Note {
  
  public func isEnharmonic(to note: Note) -> Bool {
    note.semitonesNormalized == self.semitonesNormalized
  }
  
  // TODO: What if semitones in note? Does not make sense Make a static function on Interval instead.
  public var semitonesNormalized: Int {
    (diatonicInterval.semitonesCount() + Interval.octave().semitonesCount()) % Interval.octave().semitonesCount()
  }

  public func transposed(by interval: Interval, direction: VerticalDirection = .up) -> Note {
    let cMajorRalativeFunction = Scale.diatonic.chromaticFunction(at: diatonicInterval + (direction == .up ? interval : interval.inverted))!
    return Note(from: cMajorRalativeFunction)
  }

  private init(from cMajorFunction: Scale.Function) {
    self.name = Note.Name(rawValue: cMajorFunction.number.rawValue - 1)!
    self.accidental = cMajorFunction.accidental
  }

  private var diatonicInterval: Interval {
    Scale.diatonic.degrees[name.rawValue].intervalFromRoot + accidental.interval
  }
}

public func + (note: Note, interval: Interval) -> Note {
  note.transposed(by: interval)
}

public func - (note: Note, interval: Interval) -> Note {
  note.transposed(by: interval, direction: .down)
}

fileprivate extension Accidental {
  var interval: Interval {
    switch self {
    case .flattened(let times):
        .unison(.diminished(times: times))
    case .natural:
        .unison(.perfect)
    case .sharpened(let times):
        .unison(.augmented(times: times))
    }
  }
}

extension Note {
  public func sequence(length: Int, intervalToMove: Interval = .fifth()) -> [Note] {
    var notes = [self]
    for noteIndex in (1..<length) {
      notes.append(notes[noteIndex-1] + intervalToMove)
      }
    return notes
  }
}
