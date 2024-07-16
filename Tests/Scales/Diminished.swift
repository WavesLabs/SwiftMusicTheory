import Testing
import SwiftMusicTheory
import Foundation

struct DiminishedTests {

  let diminished = Scale.diminished

  @Test func triads() {
    
  }

  @Test func degrees() {
    #expect(
      Scale.diminished.degrees() ==
      [.tonic(), .second(), .third(.flat), .fourth(), .fourth(.sharp), .fifth(.sharp), .sixth(), .seventh()]
    )
    #expect(
      Scale.diminished.mode(at: 2).degrees() ==
      [.tonic(), .second(.flat), .third(.flat), .third(), .fourth(.sharp), .fifth(), .sixth(), .seventh(.flat)]
    )
  }
}
