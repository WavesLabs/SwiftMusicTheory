extension Note {

  public func transposed(by interval: Interval, direction: VerticalDirection = .up) -> Note {
    let cMajorRalativeFunction = Scale.diatonic.chromaticFunction(at: cMajorDiatonic + (direction == .up ? interval : interval.inverted))!
    return Note(from: cMajorRalativeFunction)
  }

  private init(from cMajorFunction: Scale.Function) {
    self.name = Note.Name(rawValue: cMajorFunction.number.rawValue - 1)!
    self.accidental = cMajorFunction.accidental
  }

  public var cMajorDiatonic: Interval {
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
