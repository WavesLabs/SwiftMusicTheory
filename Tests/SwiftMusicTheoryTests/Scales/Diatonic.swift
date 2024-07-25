import Testing
import SwiftMusicTheory
import Foundation

struct DiatonicTests {

  let diatonic = Scale.diatonic

  @Test func triads() {
    #expect(diatonic.triads == [.major, .minor, .minor, .major, .major, .minor, .diminished])
    #expect(diatonic.shifted(at: 7).triads == [.major, .minor, .minor, .major, .major, .minor, .diminished])

    #expect(diatonic.shifted(at: 5).triads == [.minor, .diminished, .major, .minor, .minor, .major, .major])
  }

  @Test func modesFormulas() {
    #expect(
      diatonic.shifted(at: 3).intervals ==
      [.second(.major), .second(.major), .second(.major), .second(.minor), .second(.major), .second(.major), .second(.minor)]
    )

    #expect(
      diatonic.intervals ==
      [.second(.major), .second(.major), .second(.minor), .second(.major), .second(.major), .second(.major), .second(.minor)]
    )

    #expect(
      diatonic.shifted(at: 5).intervals ==
      [.second(.major), .second(.minor), .second(.major), .second(.major), .second(.minor), .second(.major), .second(.major)]
    )
  }

  @Test func functions() {
    #expect(diatonic.degrees.map(\.function) == [.tonic(), .second(), .third(), .fourth(), .fifth(), .sixth(), .seventh()])
    #expect(diatonic.shifted(at: 5).degrees.map(\.function) == [.tonic(), .second(), .third(.flat), .fourth(), .fifth(), .sixth(.flat), .seventh(.flat)])
    #expect(
      diatonic.functions(comparedTo: .diatonic.shifted(at: 5)) ==
      [.tonic(), .second(), .third(.sharp), .fourth(), .fifth(), .sixth(.sharp), .seventh(.sharp)]
    )
    #expect(
      diatonic.functions(comparedTo: diatonic.shifted(at: 5)) ==
      [.tonic(), .second(), .third(.sharp), .fourth(), .fifth(), .sixth(.sharp), .seventh(.sharp)]
    )
  }

  @Test func degree() {
    #expect(diatonic.chromaticFunction(at: .octave()) == .tonic())
    #expect(diatonic.chromaticFunction(at: .unison().octaves(1)) == .tonic())
    #expect(diatonic.chromaticFunction(at: .second(.major).octaves(1)) == .second())
    #expect(diatonic.chromaticFunction(at: .second(.augmented()).octaves(1)) == .second(.sharp))
    #expect(diatonic.chromaticFunction(at: .second(.augmented(times: 2)).octaves(1)) == .second(.sharpened(times: 2)))
    #expect(diatonic.chromaticFunction(at: .fifth(.augmented(times: 2)).octaves(3)) == .fifth(.sharpened(times: 2)))
    #expect(diatonic.shifted(at: 5).chromaticFunction(at: .fifth(.augmented(times: 2)).octaves(3)) == .fifth(.sharpened(times: 2)))
  }
}
