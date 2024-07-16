import os

public struct Mode: Sendable {

  public let scale: Scale
  public let notes: [Note]
  public let root: Note
  public let name: String

  public var parallelModes: [Mode] { 
    scale.degreesIndecies.map(parallelMode)
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

    self.notes = scale.formulaFromRoot.map { intervalFromRoot in root + intervalFromRoot }
    self.name = scale.modes.first ?? ""
  }

  public func parallelMode(at scaleDegree: Int) -> Mode {
    Mode(root: root, scale: scale.mode(at: scaleDegree))
  }

  public func relativeMode(at scaleDegree: Int) -> Mode {
    Mode(root: notes[scaleDegree - 1], scale: scale.mode(at: scaleDegree))
  }

  public func relativeMode(at note: Note) -> Mode? {
    guard
      let noteIndex = notes.firstIndex(of: note)
    else {
      Logger.default.error("There is no \(note) in \(self)")
      return nil
    }

    return relativeMode(at: noteIndex + 1)
  }

  public func degree(under note: Note) -> Scale.Degree? {
    guard let noteIndex = notes.firstIndex(of: note) else {
      Logger.default.error("There is no \(note) in \(self)")
      return nil
    }

    return scale.degrees()[noteIndex]
  }

  // TODO: Refactor this! Index of the degree may not be laid out with diatonic number!!
  public func triad(on degree: Scale.Degree) -> Triad? {
    scale.formula.triad(for: degree.number.rawValue - 1)
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
