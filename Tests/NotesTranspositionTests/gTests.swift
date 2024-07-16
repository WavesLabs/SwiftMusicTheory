import Testing
import SwiftMusicTheory
import Foundation

final class GTests {

  @Test func GTranspositionUp() {
    #expect(Note.g + .unison() == .g)
    #expect(Note.g + .unison(.augmented()) == .g.sharp())
    #expect(Note.g + .unison(.augmented(times: 2)) == .g.sharp(2))
    #expect(Note.g + .unison(.diminished()) == .g.flat())
    #expect(Note.g + .unison(.diminished(times: 2)) == .g.flat(2))

    #expect(Note.g + .second(.minor) == .a.flat())
    #expect(Note.g + .second(.diminished()) == .a.flat(2))
    #expect(Note.g + .second(.major) == .a)
    #expect(Note.g + .second(.augmented()) == .a.sharp())
    #expect(Note.g + .second(.augmented(times: 2)) == .a.sharp(2))

    #expect(Note.g + .third(.minor) == .b.flat())
    #expect(Note.g + .third(.diminished()) == .b.flat(2))
    #expect(Note.g + .third(.major) == .b)
    #expect(Note.g + .third(.augmented()) == .b.sharp())
    #expect(Note.g + .third(.augmented(times: 2)) == .b.sharp(2))

    #expect(Note.g + .fourth(.perfect) == .c)
    #expect(Note.g + .fourth(.diminished()) == .c.flat())
    #expect(Note.g + .fourth(.augmented()) == .c.sharp())

    #expect(Note.g + .fifth(.perfect) == .d)
    #expect(Note.g + .fifth(.diminished()) == .d.flat())
    #expect(Note.g + .fifth(.augmented()) == .d.sharp())

    #expect(Note.g + .sixth(.minor) == .e.flat())
    #expect(Note.g + .sixth(.diminished()) == .e.flat(2))
    #expect(Note.g + .sixth(.major) == .e)
    #expect(Note.g + .sixth(.augmented()) == .e.sharp())

    #expect(Note.g + .seventh(.minor) == .f)
    #expect(Note.g + .seventh(.diminished()) == .f.flat())
    #expect(Note.g + .seventh(.major) == .f.sharp())
    #expect(Note.g + .seventh(.augmented()) == .f.sharp(2))

    #expect(Note.g + .octave() == .g)
    #expect(Note.g + .octave(.augmented()) == .g.sharp())
    #expect(Note.g + .octave(.diminished()) == .g.flat())
  }

  @Test func GFlatTranspositionUp() {
    #expect(Note.g.flat() + .unison() == .g.flat())
    #expect(Note.g.flat() + .unison(.augmented()) == .g)
    #expect(Note.g.flat() + .unison(.augmented(times: 2)) == .g.sharp())
    #expect(Note.g.flat() + .unison(.diminished()) == .g.flat(2))
    #expect(Note.g.flat() + .unison(.diminished(times: 2)) == .g.flat(3))

    #expect(Note.g.flat() + .second(.minor) == .a.flat(2))
    #expect(Note.g.flat() + .second(.diminished()) == .a.flat(3))
    #expect(Note.g.flat() + .second(.major) == .a.flat())
    #expect(Note.g.flat() + .second(.augmented()) == .a)
    #expect(Note.g.flat() + .second(.augmented(times: 2)) == .a.sharp())

    #expect(Note.g.flat() + .third(.minor) == .b.flat(2))
    #expect(Note.g.flat() + .third(.diminished()) == .b.flat(3))
    #expect(Note.g.flat() + .third(.major) == .b.flat())
    #expect(Note.g.flat() + .third(.augmented()) == .b)
    #expect(Note.g.flat() + .third(.augmented(times: 2)) == .b.sharp())

    #expect(Note.g.flat() + .fourth(.perfect) == .c.flat())
    #expect(Note.g.flat() + .fourth(.diminished()) == .c.flat(2))
    #expect(Note.g.flat() + .fourth(.augmented()) == .c)

    #expect(Note.g.flat() + .fifth(.perfect) == .d.flat())
    #expect(Note.g.flat() + .fifth(.diminished()) == .d.flat(2))
    #expect(Note.g.flat() + .fifth(.augmented()) == .d)

    #expect(Note.g.flat() + .sixth(.minor) == .e.flat(2))
    #expect(Note.g.flat() + .sixth(.diminished()) == .e.flat(3))
    #expect(Note.g.flat() + .sixth(.major) == .e.flat())
    #expect(Note.g.flat() + .sixth(.augmented()) == .e)

    #expect(Note.g.flat() + .seventh(.minor) == .f.flat())
    #expect(Note.g.flat() + .seventh(.diminished()) == .f.flat(2))
    #expect(Note.g.flat() + .seventh(.major) == .f)
    #expect(Note.g.flat() + .seventh(.augmented()) == .f.sharp())

    #expect(Note.g.flat() + .octave() == .g.flat())
    #expect(Note.g.flat() + .octave(.augmented()) == .g)
    #expect(Note.g.flat() + .octave(.diminished()) == .g.flat(2))
  }

  @Test func GSharpTranspositionUp() {
    #expect(Note.g.sharp() + .unison() == .g.sharp())
    #expect(Note.g.sharp() + .unison(.augmented()) == .g.sharp(2))
    #expect(Note.g.sharp() + .unison(.augmented(times: 2)) == .g.sharp(3))
    #expect(Note.g.sharp() + .unison(.diminished()) == .g)
    #expect(Note.g.sharp() + .unison(.diminished(times: 2)) == .g.flat())

    #expect(Note.g.sharp() + .second(.minor) == .a)
    #expect(Note.g.sharp() + .second(.diminished()) == .a.flat())
    #expect(Note.g.sharp() + .second(.major) == .a.sharp())
    #expect(Note.g.sharp() + .second(.augmented()) == .a.sharp(2))
    #expect(Note.g.sharp() + .second(.augmented(times: 2)) == .a.sharp(3))

    #expect(Note.g.sharp() + .third(.minor) == .b)
    #expect(Note.g.sharp() + .third(.diminished()) == .b.flat())
    #expect(Note.g.sharp() + .third(.major) == .b.sharp())
    #expect(Note.g.sharp() + .third(.augmented()) == .b.sharp(2))
    #expect(Note.g.sharp() + .third(.augmented(times: 2)) == .b.sharp(3))

    #expect(Note.g.sharp() + .fourth(.perfect) == .c.sharp())
    #expect(Note.g.sharp() + .fourth(.diminished()) == .c)
    #expect(Note.g.sharp() + .fourth(.augmented()) == .c.sharp(2))
    #expect(Note.g.sharp() + .fourth(.augmented(times: 2)) == .c.sharp(3))

    #expect(Note.g.sharp() + .fifth(.perfect) == .d.sharp())
    #expect(Note.g.sharp() + .fifth(.diminished()) == .d)
    #expect(Note.g.sharp() + .fifth(.augmented()) == .d.sharp(2))
    #expect(Note.g.sharp() + .fifth(.augmented(times: 2)) == .d.sharp(3))

    #expect(Note.g.sharp() + .sixth(.minor) == .e)
    #expect(Note.g.sharp() + .sixth(.diminished()) == .e.flat())
    #expect(Note.g.sharp() + .sixth(.major) == .e.sharp())
    #expect(Note.g.sharp() + .sixth(.augmented()) == .e.sharp(2))
    #expect(Note.g.sharp() + .sixth(.augmented(times: 2)) == .e.sharp(3))

    #expect(Note.g.sharp() + .seventh(.minor) == .f.sharp())
    #expect(Note.g.sharp() + .seventh(.diminished()) == .f)
    #expect(Note.g.sharp() + .seventh(.major) == .f.sharp(2))
    #expect(Note.g.sharp() + .seventh(.augmented()) == .f.sharp(3))
    #expect(Note.g.sharp() + .seventh(.augmented(times: 2)) == Note(name: .f, accidental: .sharpened(times: 4)))

    #expect(Note.g.sharp() + .octave() == .g.sharp())
    #expect(Note.g.sharp() + .octave(.augmented()) == .g.sharp(2))
    #expect(Note.g.sharp() + .octave(.diminished()) == .g)
  }
}
