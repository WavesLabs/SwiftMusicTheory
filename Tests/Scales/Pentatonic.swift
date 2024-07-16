import Testing
import SwiftMusicTheory
import Foundation

struct PentatonicTests {

  let pentatonic = Scale.pentatonic

  @Test
  func degrees() {
    #expect(pentatonic.degrees() == [.tonic(), .second(), .third(), .fifth(), .sixth()])
    #expect(pentatonic.mode(at: 5).degrees() == [.tonic(), .third(.flat), .fourth(), .fifth(), .seventh(.flat)])
  }

  @Test
  func degree() {
    #expect(
      pentatonic.mode(at: 5).degree(at: .fifth(.augmented(times: 2)).octaves(3)) ==
        .fifth(.sharpened(times: 2))
    )
  }
}
