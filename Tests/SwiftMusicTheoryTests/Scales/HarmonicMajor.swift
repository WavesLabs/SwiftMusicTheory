import Testing
import SwiftMusicTheory
import Foundation

struct HarmonicMajorTests {
  let scale = Scale.harmonicMajor

  @Test
  func functions() {
    #expect(scale.shifted(at: 1).functions() == [.tonic(), .second(), .third(.flat), .fourth(), .fifth(.flat), .sixth(), .seventh(.flat)])
    #expect(scale.shifted(at: 2).functions() == [.tonic(), .second(.flat), .third(.flat), .fourth(.flat), .fifth(), .sixth(.flat), .seventh(.flat)])
    #expect(scale.shifted(at: 3).functions() == [.tonic(), .second(), .third(.flat), .fourth(.sharp), .fifth(), .sixth(), .seventh()])
    #expect(scale.shifted(at: 4).functions() == [.tonic(), .second(.flat), .third(), .fourth(), .fifth(), .sixth(), .seventh(.flat)])
    #expect(scale.shifted(at: 5).functions() == [.tonic(), .second(.sharp), .third(), .fourth(.sharp), .fifth(.sharp), .sixth(), .seventh()])
    #expect(scale.shifted(at: 6).functions() == [.tonic(), .second(.flat), .third(.flat), .fourth(), .fifth(.flat), .sixth(.flat), .seventh(.flattened(times: 2))])
    #expect(scale.shifted(at: 7).functions() == [.tonic(), .second(), .third(), .fourth(), .fifth(), .sixth(.flat), .seventh()])
  }


  @Test func triads() {
    #expect(scale.triads == [.major, .diminished, .minor, .minor, .major, .augmented, .diminished])
  }
}
