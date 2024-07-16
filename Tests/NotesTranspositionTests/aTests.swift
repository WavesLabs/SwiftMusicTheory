import Testing
import SwiftMusicTheory
import Foundation

final class ATests {
  @Test func ATranspositionUp() {
    #expect(Note.a + .unison() == .a)
    #expect(Note.a + .unison(.augmented()) == .a.sharp())
    #expect(Note.a + .unison(.augmented(times: 2)) == .a.sharp(2))
    #expect(Note.a + .unison(.diminished()) == .a.flat())
    #expect(Note.a + .unison(.diminished(times: 2)) == .a.flat(2))

    #expect(Note.a + .second(.minor) == .b.flat())
    #expect(Note.a + .second(.diminished()) == .b.flat(2))
    #expect(Note.a + .second(.major) == .b)
    #expect(Note.a + .second(.augmented()) == .b.sharp())
    #expect(Note.a + .second(.augmented(times: 2)) == .b.sharp(2))

    #expect(Note.a + .third(.minor) == .c)
    #expect(Note.a + .third(.diminished()) == .c.flat())
    #expect(Note.a + .third(.major) == .c.sharp())
    #expect(Note.a + .third(.augmented()) == .c.sharp(2))
    #expect(Note.a + .third(.augmented(times: 2)) == .c.sharp(3))

    #expect(Note.a + .fourth(.perfect) == .d)
    #expect(Note.a + .fourth(.diminished()) == .d.flat())
    #expect(Note.a + .fourth(.augmented()) == .d.sharp())
    #expect(Note.a + .fourth(.augmented(times: 2)) == .d.sharp(2))

    #expect(Note.a + .fifth(.perfect) == .e)
    #expect(Note.a + .fifth(.diminished()) == .e.flat())
    #expect(Note.a + .fifth(.augmented()) == .e.sharp())
    #expect(Note.a + .fifth(.augmented(times: 2)) == .e.sharp(2))

    #expect(Note.a + .sixth(.minor) == .f)
    #expect(Note.a + .sixth(.diminished()) == .f.flat())
    #expect(Note.a + .sixth(.major) == .f.sharp())
    #expect(Note.a + .sixth(.augmented()) == .f.sharp(2))
    #expect(Note.a + .sixth(.augmented(times: 2)) == .f.sharp(3))

    #expect(Note.a + .seventh(.minor) == .g)
    #expect(Note.a + .seventh(.diminished()) == .g.flat())
    #expect(Note.a + .seventh(.major) == .g.sharp())
    #expect(Note.a + .seventh(.augmented()) == .g.sharp(2))
    #expect(Note.a + .seventh(.augmented(times: 2)) == .g.sharp(3))

    #expect(Note.a + .octave() == .a)
    #expect(Note.a + .octave(.augmented()) == .a.sharp())
    #expect(Note.a + .octave(.diminished()) == .a.flat())
  }

  @Test func AFlatTranspositionUp() {
    #expect(Note.a.flat() + .unison() == .a.flat())
    #expect(Note.a.flat() + .unison(.augmented()) == .a)
    #expect(Note.a.flat() + .unison(.augmented(times: 2)) == .a.sharp())
    #expect(Note.a.flat() + .unison(.diminished()) == .a.flat(2))
    #expect(Note.a.flat() + .unison(.diminished(times: 2)) == .a.flat(3))

    #expect(Note.a.flat() + .second(.minor) == .b.flat(2))
    #expect(Note.a.flat() + .second(.diminished()) == .b.flat(3))
    #expect(Note.a.flat() + .second(.major) == .b.flat())
    #expect(Note.a.flat() + .second(.augmented()) == .b)
    #expect(Note.a.flat() + .second(.augmented(times: 2)) == .b.sharp())

    #expect(Note.a.flat() + .third(.minor) == .c.flat())
    #expect(Note.a.flat() + .third(.diminished()) == .c.flat(2))
    #expect(Note.a.flat() + .third(.major) == .c)
    #expect(Note.a.flat() + .third(.augmented()) == .c.sharp())
    #expect(Note.a.flat() + .third(.augmented(times: 2)) == .c.sharp(2))

    #expect(Note.a.flat() + .fourth(.perfect) == .d.flat())
    #expect(Note.a.flat() + .fourth(.diminished()) == .d.flat(2))
    #expect(Note.a.flat() + .fourth(.augmented()) == .d)
    #expect(Note.a.flat() + .fourth(.augmented(times: 2)) == .d.sharp())

    #expect(Note.a.flat() + .fifth(.perfect) == .e.flat())
    #expect(Note.a.flat() + .fifth(.diminished()) == .e.flat(2))
    #expect(Note.a.flat() + .fifth(.augmented()) == .e)
    #expect(Note.a.flat() + .fifth(.augmented(times: 2)) == .e.sharp())

    #expect(Note.a.flat() + .sixth(.minor) == .f.flat())
    #expect(Note.a.flat() + .sixth(.diminished()) == .f.flat(2))
    #expect(Note.a.flat() + .sixth(.major) == .f)
    #expect(Note.a.flat() + .sixth(.augmented()) == .f.sharp())
    #expect(Note.a.flat() + .sixth(.augmented(times: 2)) == .f.sharp(2))

    #expect(Note.a.flat() + .seventh(.minor) == .g.flat())
    #expect(Note.a.flat() + .seventh(.diminished()) == .g.flat(2))
    #expect(Note.a.flat() + .seventh(.major) == .g)
    #expect(Note.a.flat() + .seventh(.augmented()) == .g.sharp())
    #expect(Note.a.flat() + .seventh(.augmented(times: 2)) == .g.sharp(2))

    #expect(Note.a.flat() + .octave() == .a.flat())
    #expect(Note.a.flat() + .octave(.augmented()) == .a)
    #expect(Note.a.flat() + .octave(.diminished()) == .a.flat(2))
  }

  @Test func ASharpTranspositionUp() {
    #expect(Note.a.sharp() + .unison() == .a.sharp())
    #expect(Note.a.sharp() + .unison(.augmented()) == .a.sharp(2))
    #expect(Note.a.sharp() + .unison(.augmented(times: 2)) == .a.sharp(3))
    #expect(Note.a.sharp() + .unison(.diminished()) == .a)
    #expect(Note.a.sharp() + .unison(.diminished(times: 2)) == .a.flat())

    #expect(Note.a.sharp() + .second(.minor) == .b)
    #expect(Note.a.sharp() + .second(.diminished()) == .b.flat())
    #expect(Note.a.sharp() + .second(.major) == .b.sharp())
    #expect(Note.a.sharp() + .second(.augmented()) == .b.sharp(2))
    #expect(Note.a.sharp() + .second(.augmented(times: 2)) == .b.sharp(3))

    #expect(Note.a.sharp() + .third(.minor) == .c.sharp())
    #expect(Note.a.sharp() + .third(.diminished()) == .c)
    #expect(Note.a.sharp() + .third(.major) == .c.sharp(2))
    #expect(Note.a.sharp() + .third(.augmented()) == .c.sharp(3))
    #expect(Note.a.sharp() + .third(.augmented(times: 2)) == Note(name: .c, accidental: .sharpened(times: 4)))

    #expect(Note.a.sharp() + .fourth(.perfect) == .d.sharp())
    #expect(Note.a.sharp() + .fourth(.diminished()) == .d)
    #expect(Note.a.sharp() + .fourth(.augmented()) == .d.sharp(2))
    #expect(Note.a.sharp() + .fourth(.augmented(times: 2)) == .d.sharp(3))

    #expect(Note.a.sharp() + .fifth(.perfect) == .e.sharp())
    #expect(Note.a.sharp() + .fifth(.diminished()) == .e)
    #expect(Note.a.sharp() + .fifth(.augmented()) == .e.sharp(2))
    #expect(Note.a.sharp() + .fifth(.augmented(times: 2)) == .e.sharp(3))

    #expect(Note.a.sharp() + .sixth(.minor) == .f.sharp())
    #expect(Note.a.sharp() + .sixth(.diminished()) == .f)
    #expect(Note.a.sharp() + .sixth(.major) == .f.sharp(2))
    #expect(Note.a.sharp() + .sixth(.augmented()) == .f.sharp(3))
    #expect(Note.a.sharp() + .sixth(.augmented(times: 2)) == Note(name: .f, accidental: .sharpened(times: 4)))

    #expect(Note.a.sharp() + .seventh(.minor) == .g.sharp())
    #expect(Note.a.sharp() + .seventh(.diminished()) == .g)
    #expect(Note.a.sharp() + .seventh(.major) == .g.sharp(2))
    #expect(Note.a.sharp() + .seventh(.augmented()) == .g.sharp(3))
    #expect(Note.a.sharp() + .seventh(.augmented(times: 2)) == Note(name: .g, accidental: .sharpened(times: 4)))

    #expect(Note.a.sharp() + .octave() == .a.sharp())
    #expect(Note.a.sharp() + .octave(.augmented()) == .a.sharp(2))
    #expect(Note.a.sharp() + .octave(.diminished()) == .a)

  }
}
