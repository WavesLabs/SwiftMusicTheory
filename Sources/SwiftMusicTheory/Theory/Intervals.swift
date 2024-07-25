public enum Interval: Sendable, Hashable {
  case perfect(Perfect, Perfect.Quality, octaves: Int = 0)
  case imperfect(Imperfect, Imperfect.Quality, octaves: Int = 0)
}

public extension Interval {
  static func unison(_ quality: Perfect.Quality = .perfect) -> Interval { .perfect(.unison, quality) }
  static func fourth(_ quality: Perfect.Quality = .perfect) -> Interval { .perfect(.fourth, quality) }
  static func fifth(_ quality: Perfect.Quality = .perfect) -> Interval { .perfect(.fifth, quality) }
  static func octave(_ quality: Perfect.Quality = .perfect) -> Interval { .perfect(.octave, quality) }

  static func second(_ quality: Imperfect.Quality) -> Interval { .imperfect(.second, quality) }
  static func third(_ quality: Imperfect.Quality) -> Interval { .imperfect(.third, quality) }
  static func sixth(_ quality: Imperfect.Quality) -> Interval { .imperfect(.sixth, quality) }
  static func seventh(_ quality: Imperfect.Quality) -> Interval { .imperfect(.seventh, quality) }

  func octaves(_ octaves: Int) -> Interval {
    switch self {
    case .perfect(let interval, let quality, _):
      return .perfect(interval, quality, octaves: octaves)
    case .imperfect(let interval, let quality, _):
      return .imperfect(interval, quality, octaves: octaves)
    }
  }
}

extension Interval {

  public typealias Number = Int

  public enum Imperfect: Number, Sendable, Hashable, Equatable {
    public enum Quality: Sendable, Hashable, Equatable {
      case major
      case minor
      case diminished(times: Int = 1)
      case augmented(times: Int = 1)
    }

    case second = 2
    case third = 3
    case sixth = 6
    case seventh = 7
  }

  public enum Perfect: Number, Sendable, Hashable, Equatable {
    public enum Quality: Sendable, Hashable, Equatable {
      case perfect
      case diminished(times: Int = 1)
      case augmented(times: Int = 1)
    }

    case unison = 1
    case fourth = 4
    case fifth = 5
    case octave = 8
  }
}

extension Interval {
  public var inverted: Interval {
    .octave(.perfect).octaves(octaves) - self
  }
}

extension Interval {
  public func semitonesCount(includingOctaves: Bool = false) -> Int {
    switch self {
    case .perfect(let perfect, let quality, let octaves):
      perfect.baseSemitonesCount + quality.semitonesDifference + (includingOctaves ? octaves * Interval.Perfect.octave.baseSemitonesCount : 0)
    case .imperfect(let imperfect, let quality, let octaves):
      imperfect.baseSemitonesCount + quality.semitonesDifference + (includingOctaves ? octaves * Interval.Perfect.octave.baseSemitonesCount : 0)
    }
  }

  public var diatonicIndex: Int {
    switch self {
    case .perfect(let interval, _, _): 
      interval.rawValue + octaves * Imperfect.seventh.rawValue
    case .imperfect(let interval, _, _):
      interval.rawValue + octaves * Imperfect.seventh.rawValue
    }
  }

  public var diatonicIndexNormilized: Int {
    (diatonicIndex - 1) % Imperfect.seventh.rawValue + 1
  }

  public var octaves: Int {
    switch self {
    case .perfect(_, _, let octaves): octaves
    case .imperfect(_, _, let octaves): octaves
    }
  }
}

extension Interval.Perfect {

  fileprivate var baseSemitonesCount: Int {
    switch self {
    case .unison: 0
    case .fourth: 5
    case .fifth: 7
    case .octave: 12
    }
  }
}

extension Interval.Imperfect {

  fileprivate var baseSemitonesCount: Int {
    switch self {
    case .second: 2
    case .third: 4
    case .sixth: 9
    case .seventh: 11
    }
  }
}

extension Interval.Perfect.Quality {

  fileprivate init(_ semitonesDifference: Int) {
    switch semitonesDifference {
    case 0:
      self = .perfect
    case (..<0):
      self = .diminished(times: abs(semitonesDifference))
    default:
      self = .augmented(times: semitonesDifference)
    }
  }

  fileprivate var semitonesDifference: Int {
    switch self {
    case .perfect:
      return 0
    case .diminished(let times):
      return -times
    case .augmented(let times):
      return times
    }
  }
}

extension Interval.Imperfect.Quality {

  fileprivate init(_ semitonesDifference: Int) {
    switch semitonesDifference {
    case 0:
      self = .major
    case -1:
      self = .minor
    case (1...):
      self = .augmented(times: semitonesDifference)
    default:
      self = .diminished(times: abs(semitonesDifference + 1))
    }
  }

  fileprivate var semitonesDifference: Int {
    switch self {
    case .major:
      return 0
    case .minor:
      return -1
    case .diminished(let times):
      return -1 - times
    case .augmented(let times):
      return times
    }
  }
}

extension Interval: AdditiveArithmetic {

  public init(diatonicIndex: Interval.Number, semitones: Int) {
    let octaves = (diatonicIndex <= 8) ? 0 : (diatonicIndex / Interval.octave().diatonicIndex)
    let diatonicIndex = diatonicIndex - Imperfect.seventh.rawValue * octaves
    let semitonesCount = semitones - octaves * Interval.octave().semitonesCount()

    if let interval = Perfect(rawValue: diatonicIndex) {
      self = .perfect(interval, Perfect.Quality(semitonesCount - interval.baseSemitonesCount), octaves: octaves)
    } else {
      let interval = Imperfect(rawValue: diatonicIndex)!
      self = .imperfect(interval, Imperfect.Quality(semitonesCount - interval.baseSemitonesCount), octaves: octaves)
    }
  }

  public static func - (lhs: Interval, rhs: Interval) -> Interval {
    Interval(
      diatonicIndex: abs(lhs.diatonicIndex - rhs.diatonicIndex) + 1,
      semitones: abs(lhs.semitonesCount(includingOctaves: true) - rhs.semitonesCount(includingOctaves: true))
    )
  }

  public static func + (lhs: Interval, rhs: Interval) -> Interval {
    Interval(
      diatonicIndex: lhs.diatonicIndex + rhs.diatonicIndex - 1,
      semitones: lhs.semitonesCount(includingOctaves: true) + rhs.semitonesCount(includingOctaves: true)
    )
  }

  public static var zero: Interval {
    .unison(.perfect)
  }
}

extension Interval: Equatable {
  public static func == (lhs: Interval, rhs: Interval) -> Bool {
    // We take module here because we suppose that diminished unison == augmented unison as intervals count from the bottom note
    abs(lhs.semitonesCount(includingOctaves: true)) == abs(rhs.semitonesCount(includingOctaves: true)) &&
    lhs.diatonicIndexNormilized == rhs.diatonicIndexNormilized
  }
}
