import Testing
import SwiftMusicTheory
import Foundation

struct DiatonicTests {

  let diatonic = Scale.diatonic

  @Test func triads() {
    #expect(diatonic.triads == [.major, .minor, .minor, .major, .major, .minor, .diminished])

    #expect(diatonic.mode(at: 6).triads == [.minor, .diminished, .major, .minor, .minor, .major, .major])
  }

  @Test func modesFormulas() {
    #expect(
      diatonic.mode(at: 4).formula ==
      [.second(.major), .second(.major), .second(.major), .second(.minor), .second(.major), .second(.major), .second(.minor)]
    )

    #expect(
      diatonic.formula ==
      [.second(.major), .second(.major), .second(.minor), .second(.major), .second(.major), .second(.major), .second(.minor)]
    )

    #expect(
      diatonic.mode(at: 6).formula ==
      [.second(.major), .second(.minor), .second(.major), .second(.major), .second(.minor), .second(.major), .second(.major)]
    )
  }

  @Test func degrees() {
    #expect(
      diatonic.degrees() ==
      [.tonic(), .second(), .third(), .fourth(), .fifth(), .sixth(), .seventh()]
    )
    #expect(
      diatonic.mode(at: 6).degrees() ==
      [.tonic(), .second(), .third(.flat), .fourth(), .fifth(), .sixth(.flat), .seventh(.flat)]
    )
    #expect(
      diatonic.degrees(comparedTo: .diatonic.mode(at: 6)) ==
      [.tonic(), .second(), .third(.sharp), .fourth(), .fifth(), .sixth(.sharp), .seventh(.sharp)]
    )
    #expect(
      diatonic.degrees(comparedTo: diatonic.mode(at: 6)) ==
      [.tonic(), .second(), .third(.sharp), .fourth(), .fifth(), .sixth(.sharp), .seventh(.sharp)]
    )
  }

  @Test func degree() {
    #expect(diatonic.degree(at: .octave()) == .tonic())
    #expect(diatonic.degree(at: .unison().octaves(1)) == .tonic())
    #expect(diatonic.degree(at: .second(.major).octaves(1)) == .second())
    #expect(diatonic.degree(at: .second(.augmented()).octaves(1)) == .second(.sharp))
    #expect(diatonic.degree(at: .second(.augmented(times: 2)).octaves(1)) == .second(.sharpened(times: 2)))
    #expect(diatonic.degree(at: .fifth(.augmented(times: 2)).octaves(3)) == .fifth(.sharpened(times: 2)))
    #expect(diatonic.mode(at: 6).degree(at: .fifth(.augmented(times: 2)).octaves(3)) == .fifth(.sharpened(times: 2)))
  }
}
