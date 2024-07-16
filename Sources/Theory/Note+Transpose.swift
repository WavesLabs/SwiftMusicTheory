extension Note {

  public func transposed(by interval: Interval, direction: VerticalDirection = .up) -> Note {
    let cMajorDegree = Scale.diatonic.degree(at: cMajorDiatonic + (direction == .up ? interval : interval.inverted))!
    return Note(from: cMajorDegree)
  }

  private init(from cMajorDegree: Scale.Degree) {
    self.name = Note.Name(rawValue: cMajorDegree.number.rawValue - 1)!
    self.accidental = cMajorDegree.accidental
  }

  public var cMajorDiatonic: Interval {
    Scale.diatonic.formulaFromRoot[name.rawValue] + accidental.interval
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
