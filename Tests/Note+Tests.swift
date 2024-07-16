import Testing
import SwiftMusicTheory

final class NoteTests {

  @Test func sharpened() async throws {
    #expect(Note.f.sharp().sharp() == .f.sharp(2))
    #expect(Note.f.flat().sharp() == .f)
    #expect(Note.f.flat(2).sharp() == .f.flat())
  }

  @Test func flattened() async throws {
    #expect(Note.f.flat().flat() == .f.flat(2))
    #expect(Note.f.sharp().flat() == .f)
    #expect(Note.f.sharp(2).flat() == .f.sharp())
  }

  @Test func enharmonisms() async throws {
    #expect(Note.f.flat().diatonicEnharmonism(shifted: -1) == .e)
    #expect(Note.e.sharp().diatonicEnharmonism(shifted: 1) == .f)
    #expect(Note.c.flat().diatonicEnharmonism(shifted: -1) == .b)
    #expect(Note.b.sharp().diatonicEnharmonism(shifted: 1) == .c)
  }

  @Test(arguments: [
    (Note.c, 0),
    (Note.c.sharp(), 1),
    (Note.d.flat(), 1),
    (Note.d, 2),
    (Note.d.sharp(), 3),
    (Note.e.flat(), 3),
    (Note.e, 4),
    (Note.f.flat(), 4),
    (Note.f, 5),
    (Note.e.sharp(), 5),
    (Note.f.sharp(), 6),
    (Note.g.flat(), 6),
    (Note.g, 7),
    (Note.g.sharp(), 8),
    (Note.a.flat(), 8),
    (Note.a, 9),
    (Note.a.sharp(), 10),
    (Note.b.flat(), 10),
    (Note.b, 11),
    (Note.b.sharp(), 12)
  ])
  func cMajorSemitonesCount(_ testCase: (Note, Int)) async throws {
    let cMajorDiatonic = testCase.0.cMajorDiatonic
    let semitonesCount = cMajorDiatonic.semitonesCount()
    #expect(semitonesCount == testCase.1)
  }
}