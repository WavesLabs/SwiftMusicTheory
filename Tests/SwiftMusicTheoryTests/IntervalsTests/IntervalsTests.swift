import Testing
import SwiftMusicTheory
import Foundation

final class IntervalsTests {

  @Test func SimpleIntervalsShortNames() throws {
    #expect(Interval.unison().shortTitle == "P1")
    #expect(Interval.unison(.augmented()).shortTitle == "A1")

    #expect(Interval.second(.major).shortTitle == "M2")
    #expect(Interval.second(.minor).shortTitle == "m2")
    #expect(Interval.second(.augmented()).shortTitle == "A2")
    #expect(Interval.second(.diminished()).shortTitle == "d2")

    #expect(Interval.third(.major).shortTitle == "M3")
    #expect(Interval.third(.minor).shortTitle == "m3")
    #expect(Interval.third(.augmented()).shortTitle == "A3")
    #expect(Interval.third(.diminished()).shortTitle == "d3")
    #expect(Interval.third(.augmented(times: 2)).shortTitle == "AA3")
    #expect(Interval.third(.diminished(times: 2)).shortTitle == "dd3")

    #expect(Interval.fourth().shortTitle == "P4")
    #expect(Interval.fourth(.augmented()).shortTitle == "A4")
    #expect(Interval.fourth(.diminished()).shortTitle == "d4")
    #expect(Interval.fourth(.augmented(times: 2)).shortTitle == "AA4")
    #expect(Interval.fourth(.diminished(times: 2)).shortTitle == "dd4")

    #expect(Interval.fifth().shortTitle == "P5")
    #expect(Interval.fifth(.augmented()).shortTitle == "A5")
    #expect(Interval.fifth(.diminished()).shortTitle == "d5")
    #expect(Interval.fifth(.augmented(times: 2)).shortTitle == "AA5")
    #expect(Interval.fifth(.diminished(times: 2)).shortTitle == "dd5")

    #expect(Interval.sixth(.major).shortTitle == "M6")
    #expect(Interval.sixth(.minor).shortTitle == "m6")
    #expect(Interval.sixth(.augmented()).shortTitle == "A6")
    #expect(Interval.sixth(.diminished()).shortTitle == "d6")
    #expect(Interval.sixth(.augmented(times: 2)).shortTitle == "AA6")
    #expect(Interval.sixth(.diminished(times: 2)).shortTitle == "dd6")

    #expect(Interval.seventh(.major).shortTitle == "M7")
    #expect(Interval.seventh(.minor).shortTitle == "m7")
    #expect(Interval.seventh(.augmented()).shortTitle == "A7")
    #expect(Interval.seventh(.diminished()).shortTitle == "d7")
    #expect(Interval.seventh(.augmented(times: 2)).shortTitle == "AA7")
    #expect(Interval.seventh(.diminished(times: 2)).shortTitle == "dd7")

    #expect(Interval.octave().shortTitle == "P8")
    #expect(Interval.octave(.diminished()).shortTitle == "d8")
  }

  @Test func CompoundIntervalsShortNames() throws {
    #expect(Interval.unison().octaves(1).shortTitle == "P8")

    #expect(Interval.second(.major).octaves(1).shortTitle == "M9")
    #expect(Interval.second(.minor).octaves(1).shortTitle == "m9")
    #expect(Interval.second(.augmented()).octaves(1).shortTitle == "A9")
    #expect(Interval.second(.diminished()).octaves(1).shortTitle == "d9")

    #expect(Interval.third(.major).octaves(1).shortTitle == "M10")
    #expect(Interval.third(.minor).octaves(1).shortTitle == "m10")
    #expect(Interval.third(.augmented()).octaves(1).shortTitle == "A10")
    #expect(Interval.third(.diminished()).octaves(1).shortTitle == "d10")
    #expect(Interval.third(.augmented(times: 2)).octaves(1).shortTitle == "AA10")
    #expect(Interval.third(.diminished(times: 2)).octaves(1).shortTitle == "dd10")

    #expect(Interval.fourth().octaves(1).shortTitle == "P11")
    #expect(Interval.fourth(.augmented()).octaves(1).shortTitle == "A11")
    #expect(Interval.fourth(.diminished()).octaves(1).shortTitle == "d11")
    #expect(Interval.fourth(.augmented(times: 2)).octaves(1).shortTitle == "AA11")
    #expect(Interval.fourth(.diminished(times: 2)).octaves(1).shortTitle == "dd11")

    #expect(Interval.fifth().octaves(1).shortTitle == "P12")
    #expect(Interval.fifth(.augmented()).octaves(1).shortTitle == "A12")
    #expect(Interval.fifth(.diminished()).octaves(1).shortTitle == "d12")
    #expect(Interval.fifth(.augmented(times: 2)).octaves(1).shortTitle == "AA12")
    #expect(Interval.fifth(.diminished(times: 2)).octaves(1).shortTitle == "dd12")

    #expect(Interval.sixth(.major).octaves(1).shortTitle == "M13")
    #expect(Interval.sixth(.minor).octaves(1).shortTitle == "m13")
    #expect(Interval.sixth(.augmented()).octaves(1).shortTitle == "A13")
    #expect(Interval.sixth(.diminished()).octaves(1).shortTitle == "d13")
    #expect(Interval.sixth(.augmented(times: 2)).octaves(1).shortTitle == "AA13")
    #expect(Interval.sixth(.diminished(times: 2)).octaves(1).shortTitle == "dd13")

    #expect(Interval.seventh(.major).octaves(1).shortTitle == "M14")
    #expect(Interval.seventh(.minor).octaves(1).shortTitle == "m14")
    #expect(Interval.seventh(.augmented()).octaves(1).shortTitle == "A14")
    #expect(Interval.seventh(.diminished()).octaves(1).shortTitle == "d14")
    #expect(Interval.seventh(.augmented(times: 2)).octaves(1).shortTitle == "AA14")
    #expect(Interval.seventh(.diminished(times: 2)).octaves(1).shortTitle == "dd14")

    #expect(Interval.octave().octaves(1).shortTitle == "P15")
    #expect(Interval.octave(.diminished()).octaves(1).shortTitle == "d15")
    #expect(Interval.unison(.augmented(times: 1)).octaves(2).shortTitle == "A15")
  }

  @Test func SecondsSum() {
    #expect(
      .second(.minor) + .second(.minor) == .third(.diminished())
    )
    #expect(
      .second(.major) + .second(.minor) == .third(.minor)
    )
    #expect(
      .second(.major) + .second(.major) == .third(.major)
    )
    #expect(
      .second(.major) + .third(.minor) == .fourth()
    )
    #expect(
      .second(.major) + .third(.minor) == .fourth()
    )
    #expect(
      .second(.major) + .fourth() == .fifth()
    )
    #expect(
      .second(.major) + .fifth() == .sixth(.major)
    )
    #expect(
      .second(.major) + .sixth(.major) == .seventh(.major)
    )
    #expect(
      .second(.minor) + .seventh(.major) == .octave()
    )
    #expect(
      .second(.minor) + .seventh(.minor) == .octave(.diminished())
    )
  }

  @Test func Sixth() {
    #expect(
      Interval.second(.major) + .sixth(.augmented(times: 1)) == .seventh(.augmented())
    )
    #expect(
      Interval.second(.minor) + .sixth(.augmented(times: 1)) == .seventh(.major)
    )
  }

  @Test func intervalsInit() {
    print(Interval(diatonicIndex: 2, semitones: 2)) // Prints "major second"
    #expect(Interval(diatonicIndex: 2, semitones: 1) == .second(.minor))
    #expect(Interval(diatonicIndex: 2, semitones: 2) == .second(.major))
    #expect(Interval(diatonicIndex: 17, semitones: 28) == .third(.major).octaves(2))
    #expect(Interval(diatonicIndex: 16, semitones: 26) == .second(.major).octaves(2))
    #expect(Interval(diatonicIndex: 1, semitones: 0) == .unison())
    #expect(Interval(diatonicIndex: 1, semitones: 12) == .octave())
    #expect(Interval(diatonicIndex: 8, semitones: 0) == .unison())
    #expect(Interval(diatonicIndex: 7, semitones: 12) == .seventh(.augmented()))
    #expect(Interval(diatonicIndex: 8, semitones: 12) == .octave())
    #expect(Interval(diatonicIndex: 9, semitones: 15) == .second(.augmented()).octaves(1))
  }

  @Test func AugmentedAndDiminished() {
    #expect(
      .third(.major) + .second(.major) == .fourth(.augmented())
    )
    #expect(
      .third(.major) + .third(.major) == .fifth(.augmented())
    )
    #expect(
      .third(.minor) + .second(.minor) == .fourth(.diminished())
    )
    #expect(
      .third(.diminished()) + .second(.minor) == .fourth(.diminished(times: 2))
    )
    #expect(
      .third(.minor) + .third(.minor) == .fifth(.diminished())
    )
    #expect(
      .second(.augmented()) + .second(.minor) == .third(.major)
    )
    #expect(
      Interval.second(.diminished()) + .second(.minor) == .third(.diminished(times: 2))
    )
    #expect(
      .second(.diminished()) + .second(.major) == .third(.diminished())
    )
    #expect(
      .second(.augmented()) + .third(.minor) == .fourth(.augmented())
    )
    #expect(.second(.major) + .third(.major) == .fourth(.augmented()))
    #expect(
      .unison(.augmented()) + .octave() == .octave(.augmented())
    )
  }

  @Test func equasions() {
    #expect(Interval.second(.major) != .third(.diminished()))
    #expect(Interval.fourth(.augmented()) != .fifth(.diminished()))

    #expect(
      Interval.unison(.augmented()) == Interval.unison(.diminished())
    )
    #expect(
      Interval.octave() + .octave() + .octave() == .octave().octaves(2)
    )

    #expect(
      Interval.unison() + .octave() == .octave()
    )
  }

  @Test func fifthsSum() {
    #expect(
      .fifth() + .unison() == .fifth()
    )
  }

  @Test func cornerCases() {
    // C# -> Dbb, Dbb -> C#
    #expect(
      Interval.second(.diminished(times: 2)).inverted == .seventh(.augmented(times: 2))
    )

    // C -> C#, C# -> C
    #expect(
      Interval.octave(.augmented()).inverted == .unison(.diminished())
    )

    // C -> C#, C# -> C
    #expect(
      Interval.octave(.augmented()).inverted == .unison(.augmented())
    )

    // C -> Cb, Cb -> C
    #expect(
      Interval.unison(.diminished()).inverted == .octave(.augmented())
    )
  }

  @Test func inversions() {
    #expect(.unison().inverted == .octave())
    #expect(.second(.major).inverted == .seventh(.minor))
    #expect(.second(.augmented()).inverted == .seventh(.diminished()))
    #expect(.fifth(.augmented()).inverted == .fourth(.diminished()))
    #expect(.fourth(.diminished()).inverted == .fifth(.augmented()))
    #expect(.octave(.diminished()).inverted == .unison(.augmented()))
    #expect(.octave(.diminished()).inverted == .unison(.augmented()))
  }

  @Test func IntervalsDifference() {
    #expect(
      Interval.fifth() - Interval.fourth() == Interval.second(.major)
    )
    #expect(
      Interval.fourth() - Interval.fifth() == Interval.second(.major)
    )
    #expect(
      Interval.second(.major) - Interval.fifth() == Interval.fourth()
    )
    #expect(
      Interval.fifth() - Interval.fifth() == Interval.unison()
    )
    #expect(
      Interval.fifth() - Interval.fifth(.augmented()) == Interval.unison(.diminished())
    )
    #expect(
      Interval.fifth() - Interval.sixth(.major) == Interval.second(.major)
    )
    #expect(
      Interval.fifth() - Interval.fifth(.diminished()) == Interval.unison(.augmented())
    )
    #expect(
      Interval.fifth().octaves(1) - Interval.fifth() == Interval.octave()
    )
  }

  @Test func CompoundIntervals() {
    #expect(
      Interval.octave(.diminished()).octaves(3).inverted == Interval.unison(.augmented())
    )
    #expect(
      Interval.fifth(.augmented()).octaves(3).inverted == Interval.fourth(.diminished())
    )
    #expect(
      Interval.unison().octaves(1) == Interval.octave()
    )
    #expect(
      .second(.minor) + .octave() == .second(.minor).octaves(1)
    )
    #expect(
      .seventh(.major) + .fifth() == .fourth(.augmented()).octaves(1)
    )
    #expect(
      .fifth() + .fifth() == .second(.major).octaves(1)
    )
  }
}
