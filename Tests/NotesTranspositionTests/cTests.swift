import Testing
import SwiftMusicTheory
import Foundation

final class CTests {

  @Test func CTranspositionUp() {
    #expect(Note.c + .unison() == .c)
    #expect(Note.c + .unison(.augmented()) == .c.sharp())
    #expect(Note.c + .unison(.augmented(times: 2)) == .c.sharp(2))
    #expect(Note.c + .unison(.diminished()) == .c.flat())
    #expect(Note.c + .unison(.diminished(times: 2)) == .c.flat(2))

    #expect(Note.c + .second(.major) == .d)
    #expect(Note.c + .second(.minor) == .d.flat())
    #expect(Note.c + .second(.diminished()) == .d.flat(2))
    #expect(Note.c + .second(.diminished(times: 2)) == Note(name: .d, accidental: .flattened(times: 3)))
    #expect(Note.c + .second(.augmented()) == .d.sharp())
    #expect(Note.c + .second(.augmented(times: 2)) == .d.sharp(2))

    #expect(Note.c + .third(.major) == .e)
    #expect(Note.c + .third(.minor) == .e.flat())
    #expect(Note.c + .third(.diminished()) == .e.flat(2))
    #expect(Note.c + .third(.diminished(times: 2)) == Note(name: .e, accidental: .flattened(times: 3)))
    #expect(Note.c + .third(.augmented()) == .e.sharp())
    #expect(Note.c + .third(.augmented(times: 2)) == .e.sharp(2))

    #expect(Note.c + .fourth(.perfect) == .f)
    #expect(Note.c + .fourth(.diminished()) == .f.flat())
    #expect(Note.c + .fourth(.diminished(times: 2)) == .f.flat(2))
    #expect(Note.c + .fourth(.augmented()) == .f.sharp())
    #expect(Note.c + .fourth(.augmented(times: 2)) == .f.sharp(2))

    #expect(Note.c + .fifth(.perfect) == .g)
    #expect(Note.c + .fifth(.diminished()) == .g.flat())
    #expect(Note.c + .fifth(.diminished(times: 2)) == .g.flat(2))
    #expect(Note.c + .fifth(.augmented()) == .g.sharp())
    #expect(Note.c + .fifth(.augmented(times: 2)) == .g.sharp(2))

    #expect(Note.c + .sixth(.major) == .a)
    #expect(Note.c + .sixth(.minor) == .a.flat())
    #expect(Note.c + .sixth(.diminished()) == .a.flat(2))
    #expect(Note.c + .sixth(.diminished(times: 2)) == Note(name: .a, accidental: .flattened(times: 3)))
    #expect(Note.c + .sixth(.augmented()) == .a.sharp())
    #expect(Note.c + .sixth(.augmented(times: 2)) == .a.sharp(2))

    #expect(Note.c + .seventh(.major) == .b)
    #expect(Note.c + .seventh(.minor) == .b.flat())
    #expect(Note.c + .seventh(.diminished()) == .b.flat(2))
    #expect(Note.c + .seventh(.diminished(times: 2)) == Note(name: .b, accidental: .flattened(times: 3)))
    #expect(Note.c + .seventh(.augmented()) == .b.sharp())
    #expect(Note.c + .seventh(.augmented(times: 2)) == .b.sharp(2))

    #expect(Note.c + .seventh(.major) == .b)
    #expect(Note.c + .seventh(.minor) == .b.flat())
    #expect(Note.c + .seventh(.diminished()) == .b.flat(2))
    #expect(Note.c + .seventh(.diminished(times: 2)) == Note(name: .b, accidental: .flattened(times: 3)))
    #expect(Note.c + .seventh(.augmented()) == .b.sharp())
    #expect(Note.c + .seventh(.augmented(times: 2)) == .b.sharp(2))

    #expect(Note.c + .octave() == .c)
    #expect(Note.c + .octave(.augmented()) == .c.sharp())
    #expect(Note.c + .octave(.augmented(times: 2)) == .c.sharp(2))
    #expect(Note.c + .octave(.diminished()) == .c.flat())
    #expect(Note.c + .octave(.diminished(times: 2)) == .c.flat(2))
  }

  @Test func CSharpTranspositionUp() {
    #expect(Note.c.sharp() + .unison() == .c.sharp())
    #expect(Note.c.sharp() + .unison(.augmented()) == .c.sharp(2))
    #expect(Note.c.sharp() + .unison(.augmented(times: 2)) == .c.sharp(3))
    #expect(Note.c.sharp() + .unison(.diminished()) == .c)
    #expect(Note.c.sharp() + .unison(.diminished(times: 2)) == .c.flat())

    #expect(Note.c.sharp() + .second(.major) == .d.sharp())
    #expect(Note.c.sharp() + .second(.minor) == .d)
    #expect(Note.c.sharp() + .second(.diminished()) == .d.flat())
    #expect(Note.c.sharp() + .second(.diminished(times: 2)) == .d.flat(2))
    #expect(Note.c.sharp() + .second(.augmented()) == .d.sharp(2))
    #expect(Note.c.sharp() + .second(.augmented(times: 2)) == .d.sharp(3))

    #expect(Note.c.sharp() + .third(.major) == .e.sharp())
    #expect(Note.c.sharp() + .third(.minor) == .e)
    #expect(Note.c.sharp() + .third(.diminished()) == .e.flat())
    #expect(Note.c.sharp() + .third(.diminished(times: 2)) == .e.flat(2))
    #expect(Note.c.sharp() + .third(.augmented()) == .e.sharp(2))
    #expect(Note.c.sharp() + .third(.augmented(times: 2)) == .e.sharp(3))

    #expect(Note.c.sharp() + .fourth(.perfect) == .f.sharp())
    #expect(Note.c.sharp() + .fourth(.diminished()) == .f)
    #expect(Note.c.sharp() + .fourth(.diminished(times: 2)) == .f.flat())
    #expect(Note.c.sharp() + .fourth(.augmented()) == .f.sharp(2))
    #expect(Note.c.sharp() + .fourth(.augmented(times: 2)) == .f.sharp(3))

    #expect(Note.c.sharp() + .fifth(.perfect) == .g.sharp())
    #expect(Note.c.sharp() + .fifth(.diminished()) == .g)
    #expect(Note.c.sharp() + .fifth(.diminished(times: 2)) == .g.flat())
    #expect(Note.c.sharp() + .fifth(.augmented()) == .g.sharp(2))
    #expect(Note.c.sharp() + .fifth(.augmented(times: 2)) == .g.sharp(3))

    #expect(Note.c.sharp() + .sixth(.major) == .a.sharp())
    #expect(Note.c.sharp() + .sixth(.minor) == .a)
    #expect(Note.c.sharp() + .sixth(.diminished()) == .a.flat())
    #expect(Note.c.sharp() + .sixth(.diminished(times: 2)) == .a.flat(2))
    #expect(Note.c.sharp() + .sixth(.augmented()) == .a.sharp(2))
    #expect(Note.c.sharp() + .sixth(.augmented(times: 2)) == .a.sharp(3))

    #expect(Note.c.sharp() + .seventh(.major) == .b.sharp())
    #expect(Note.c.sharp() + .seventh(.minor) == .b)
    #expect(Note.c.sharp() + .seventh(.diminished()) == .b.flat())
    #expect(Note.c.sharp() + .seventh(.diminished(times: 2)) == .b.flat(2))
    #expect(Note.c.sharp() + .seventh(.augmented()) == .b.sharp(2))
    #expect(Note.c.sharp() + .seventh(.augmented(times: 2)) == .b.sharp(3))

    #expect(Note.c.sharp() + .octave() == .c.sharp())
    #expect(Note.c.sharp() + .octave(.augmented()) == .c.sharp(2))
    #expect(Note.c.sharp() + .octave(.augmented(times: 2)) == .c.sharp(3))
    #expect(Note.c.sharp() + .octave(.diminished()) == .c)
    #expect(Note.c.sharp() + .octave(.diminished(times: 2)) == .c.flat())
  }

  @Test func CFlatTranspositionUp() {
    #expect(Note.c.flat() + .unison() == .c.flat())
    #expect(Note.c.flat() + .unison(.augmented()) == .c)
    #expect(Note.c.flat() + .unison(.augmented(times: 2)) == .c.sharp())
    #expect(Note.c.flat() + .unison(.diminished()) == .c.flat(2))
    #expect(Note.c.flat() + .unison(.diminished(times: 2)) == Note(name: .c, accidental: .flattened(times: 3)))

    #expect(Note.c.flat() + .second(.major) == .d.flat())
    #expect(Note.c.flat() + .second(.minor) == .d.flat(2))
    #expect(Note.c.flat() + .second(.diminished()) == Note(name: .d, accidental: .flattened(times: 3)))
    #expect(Note.c.flat() + .second(.augmented()) == .d)
    #expect(Note.c.flat() + .second(.augmented(times: 2)) == .d.sharp())

    #expect(Note.c.flat() + .third(.major) == .e.flat())
    #expect(Note.c.flat() + .third(.minor) == .e.flat(2))
    #expect(Note.c.flat() + .third(.diminished()) == Note(name: .e, accidental: .flattened(times: 3)))
    #expect(Note.c.flat() + .third(.augmented()) == .e)
    #expect(Note.c.flat() + .third(.augmented(times: 2)) == .e.sharp())

    #expect(Note.c.flat() + .fourth(.perfect) == .f.flat())
    #expect(Note.c.flat() + .fourth(.diminished()) == .f.flat(2))
    #expect(Note.c.flat() + .fourth(.augmented()) == .f)
    #expect(Note.c.flat() + .fourth(.augmented(times: 2)) == .f.sharp())

    #expect(Note.c.flat() + .fifth(.perfect) == .g.flat())
    #expect(Note.c.flat() + .fifth(.diminished()) == .g.flat(2))
    #expect(Note.c.flat() + .fifth(.augmented()) == .g)
    #expect(Note.c.flat() + .fifth(.augmented(times: 2)) == .g.sharp())

    #expect(Note.c.flat() + .sixth(.major) == .a.flat())
    #expect(Note.c.flat() + .sixth(.minor) == .a.flat(2))
    #expect(Note.c.flat() + .sixth(.diminished()) == Note(name: .a, accidental: .flattened(times: 3)))
    #expect(Note.c.flat() + .sixth(.augmented()) == .a)
    #expect(Note.c.flat() + .sixth(.augmented(times: 2)) == .a.sharp())

    #expect(Note.c.flat() + .seventh(.major) == .b.flat())
    #expect(Note.c.flat() + .seventh(.minor) == .b.flat(2))
    #expect(Note.c.flat() + .seventh(.diminished()) == Note(name: .b, accidental: .flattened(times: 3)))
    #expect(Note.c.flat() + .seventh(.augmented()) == .b)
    #expect(Note.c.flat() + .seventh(.augmented(times: 2)) == .b.sharp())

    #expect(Note.c.flat() + .octave() == .c.flat())
    #expect(Note.c.flat() + .octave(.augmented()) == .c)
    #expect(Note.c.flat() + .octave(.augmented(times: 2)) == .c.sharp())
    #expect(Note.c.flat() + .octave(.diminished()) == .c.flat(2))
    #expect(Note.c.flat() + .octave(.diminished(times: 2)) == Note(name: .c, accidental: .flattened(times: 3)))
  }

}
