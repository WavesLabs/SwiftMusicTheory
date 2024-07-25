import Testing
import SwiftMusicTheory
import Foundation

final class CompoundTranspositionsTests {

  @Test func notesTransposition() throws {
    #expect(Note.g + .fifth().octaves(1) == Note.d)
    #expect(Note.c + .fifth().inverted.octaves(1) == Note.f)
    #expect(Note.c.flat() + .fifth().inverted.octaves(1) == Note.f.flat())
    #expect(Note.c.flat() + .fourth().octaves(1) == Note.f.flat())
  }
}
