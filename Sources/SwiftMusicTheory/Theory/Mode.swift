import os

public struct Mode: Sendable {

  public let scale: Scale
  public let notes: [Note]
  public let root: Note
  public let name: String
  public let chords: [Chord?]

  public var parallelModes: [Mode] {
    scale.degrees.indices.map(parallelMode)
  }
  
  public var relativeModes: [Mode] {
    notes.compactMap(relativeMode)
  }

  public init(
    root: Note,
    scale: Scale
  ) {
    self.scale = scale
    self.root = root

    self.notes = scale.degrees.map { degree in root + degree.intervalFromRoot }
    self.name = scale.degrees.first?.modeTitle ?? ""
    self.chords = notes.enumerated().map { noteIndex, note in
      guard let triad = scale.degrees[noteIndex].triad else { return nil }
      return Chord(triad: triad, root: note)
    }
  }

  public func parallelMode(at scaleDegree: Int) -> Mode {
    Mode(root: root, scale: scale.shifted(at: scaleDegree))
  }

  public func relativeMode(at scaleDegree: Int) -> Mode {
    Mode(root: notes[scaleDegree - 1], scale: scale.shifted(at: scaleDegree - 1))
  }

  public func relativeMode(at note: Note) -> Mode? {
    guard
      let noteIndex = notes.firstIndex(of: note)
    else {
      logWarning("There is no \(note) in \(self)")
      return nil
    }

    return relativeMode(at: noteIndex + 1)
  }

  public func degree(under note: Note) -> Scale.Degree? {
    guard let noteIndex = notes.firstIndex(of: note) else {
      logWarning("There is no \(note) in \(self)")
      return nil
    }

    return scale.degrees[noteIndex]
  }
}

extension Mode: CustomStringConvertible {
  public var description: String {
    title
  }

  public var title: String {
    "\(root) \(name)"
  }
}

extension Mode: Equatable { }

extension Mode {
  public func at(root note: Note) -> Mode {
    Mode(root: note, scale: self.scale)
  }
}
