import Testing
import SwiftMusicTheory
import Foundation

struct HarmonicMajorTests {
  let scale = Scale.harmonicMajor

  @Test
  func degrees() {
    #expect(scale.mode(at: 1).degrees() == [.tonic(), .second(), .third(), .fourth(), .fifth(), .sixth(.flat), .seventh()])
    #expect(scale.mode(at: 2).degrees() == [.tonic(), .second(), .third(.flat), .fourth(), .fifth(.flat), .sixth(), .seventh(.flat)])
    #expect(scale.mode(at: 3).degrees() == [.tonic(), .second(.flat), .third(.flat), .fourth(.flat), .fifth(), .sixth(.flat), .seventh(.flat)])
    #expect(scale.mode(at: 4).degrees() == [.tonic(), .second(), .third(.flat), .fourth(.sharp), .fifth(), .sixth(), .seventh()])
    #expect(scale.mode(at: 5).degrees() == [.tonic(), .second(.flat), .third(), .fourth(), .fifth(), .sixth(), .seventh(.flat)])
    #expect(scale.mode(at: 6).degrees() == [.tonic(), .second(.sharp), .third(), .fourth(.sharp), .fifth(.sharp), .sixth(), .seventh()])
    #expect(scale.mode(at: 7).degrees() == [.tonic(), .second(.flat), .third(.flat), .fourth(), .fifth(.flat), .sixth(.flat), .seventh(.flattened(times: 2))])
  }


  @Test func triads() {
    #expect(scale.mode(at: 1).triads == [.major, .diminished, .minor, .minor, .major, .augmented, .diminished])
  }
}
