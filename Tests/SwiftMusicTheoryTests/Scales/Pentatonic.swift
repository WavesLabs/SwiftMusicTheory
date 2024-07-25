import Testing
import SwiftMusicTheory
import Foundation

struct PentatonicTests {

  let pentatonic = Scale.pentatonic

  @Test
  func functions() {
    #expect(pentatonic.functions() == [.tonic(), .second(), .third(), .fifth(), .sixth()])
    #expect(pentatonic.shifted(at: 4).functions() == [.tonic(), .third(.flat), .fourth(), .fifth(), .seventh(.flat)])
    #expect(pentatonic.shifted(at: 4).functions() == [.tonic(), .third(.flat), .fourth(), .fifth(), .seventh(.flat)])
  }

  @Test
  func degree() {
    #expect(
      pentatonic.shifted(at: 5).chromaticFunction(at: .fifth(.augmented(times: 2)).octaves(3)) == .fifth(.sharpened(times: 2))
    )
  }
}
