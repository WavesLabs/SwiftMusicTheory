import Foundation
import os

extension Interval {

  public var title: String {
    "\(quality.title) \(name)" + octaves.octavesPostfix
  }

  public var shortTitle: String {
    quality.shortTitle + String(intervalIndex)
  }

  private var name: String {
    switch self {
    case .perfect(let interval, _, _):
      return interval.name
    case .imperfect(let interval, _, _):
      return interval.name
    }
  }
}

extension Interval: Interval.Quality {

  fileprivate protocol Quality {
    var title: String { get }
    var shortTitle: String { get }
  }

  fileprivate var quality: Interval.Quality {
    switch self {
    case .perfect(_, let quality, _): quality
    case .imperfect(_, let quality, _): quality
    }
  }
}

public extension Interval.Perfect {

  var name: String {
    switch self {
    case .unison: return "unison"
    case .fourth: return "fourth"
    case .fifth: return "fifth"
    case .octave: return "octave"
    }
  }
}

public extension Interval.Imperfect {

  var name: String {
    switch self {
    case .second: return "second"
    case .third: return "third"
    case .sixth: return "sixth"
    case .seventh: return "seventh"
    }
  }
}

extension Interval.Perfect.Quality: Interval.Quality {

  public var title: String {
    switch self {
    case .perfect:
      return "perfect"
    case .diminished(let times):
      return "\(times.qualityAdverb)diminished"
    case .augmented(let times):
      return "\(times.qualityAdverb)augmented"
    }
  }

  public var shortTitle: String {
    switch self {
    case .perfect:
      return "P"
    case .diminished(let times):
      return "d".repeating(times: times)
    case .augmented(let times):
      return "A".repeating(times: times)
    }
  }
}

extension Interval.Imperfect.Quality: Interval.Quality {

  public var title: String {
    switch self {
    case .major:
      return "major"
    case .minor:
      return "minor"
    case .diminished(let times):
      return "\(times.qualityAdverb)diminished"
    case .augmented(let times):
      return "\(times.qualityAdverb)augmented"
    }
  }

  public var shortTitle: String {
    switch self {
    case .major:
      return "M"
    case .minor:
      return "m"
    case .diminished(let times):
      return "d".repeating(times: times)
    case .augmented(let times):
      return "A".repeating(times: times)
    }
  }
}

fileprivate extension Int {
  var qualityAdverb: String {
    switch self {
    case 1:
      return ""
    case 2:
      return "Double "
    case 3:
      return "Triple "
    default:
      Logger.default.warning("Are tou sure you using \(self) times diminished or augmented interval?")
      return "\(self) times "
    }
  }

  var octavesPostfix: String {
    guard self > 0 else { return "" }

    return " + \(self) octaves"
  }
}

extension Interval: CustomStringConvertible {
  public var description: String {
    return title
  }
}
