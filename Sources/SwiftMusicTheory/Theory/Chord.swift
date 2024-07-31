public struct Chord: Sendable, Equatable, Hashable {
  public let triad: Triad
  public let root: Note

  /// Determines which degree is the lowest note
  /// In the first Inversion the third placed in the bottom, in 2nd Fifth and so on
  public let inversion: Int

  public init(triad: Triad, root: Note, inversion: Int = 0) {
    self.triad = triad
    self.root = root
    self.inversion = inversion
  }
}

extension Chord: CustomStringConvertible {
  
  public var description: String {
    "\(root)\(triad.title)"
  }
}
