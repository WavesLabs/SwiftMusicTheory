import Testing
import SwiftMusicTheory
import Foundation

final class ETests {

  @Test func ETranspositionUp() {
    #expect(Note.e + .unison() == .e)
    #expect(Note.e + .unison(.augmented()) == .e.sharp())
    #expect(Note.e + .unison(.augmented(times: 2)) == .e.sharp(2))
    #expect(Note.e + .unison(.diminished()) == .e.flat())
    #expect(Note.e + .unison(.diminished(times: 2)) == .e.flat(2))

    #expect(Note.e + .second(.minor) == .f)
    #expect(Note.e + .second(.diminished()) == .f.flat())
    #expect(Note.e + .second(.diminished(times: 2)) == .f.flat(2))
    #expect(Note.e + .second(.major) == .f.sharp())
    #expect(Note.e + .second(.augmented()) == .f.sharp(2))
    #expect(Note.e + .second(.augmented(times: 2)) == .f.sharp(3))

    #expect(Note.e + .third(.minor) == .g)
    #expect(Note.e + .third(.diminished()) == .g.flat())
    #expect(Note.e + .third(.diminished(times: 2)) == .g.flat(2))
    #expect(Note.e + .third(.major) == .g.sharp())
    #expect(Note.e + .third(.augmented()) == .g.sharp(2))
    #expect(Note.e + .third(.augmented(times: 2)) == .g.sharp(3))

    #expect(Note.e + .fourth(.perfect) == .a)
    #expect(Note.e + .fourth(.diminished()) == .a.flat())
    #expect(Note.e + .fourth(.diminished(times: 2)) == .a.flat(2))
    #expect(Note.e + .fourth(.augmented()) == .a.sharp())
    #expect(Note.e + .fourth(.augmented(times: 2)) == .a.sharp(2))

    #expect(Note.e + .fifth(.perfect) == .b)
    #expect(Note.e + .fifth(.diminished()) == .b.flat())
    #expect(Note.e + .fifth(.diminished(times: 2)) == .b.flat(2))
    #expect(Note.e + .fifth(.augmented()) == .b.sharp())
    #expect(Note.e + .fifth(.augmented(times: 2)) == .b.sharp(2))

    #expect(Note.e + .sixth(.minor) == .c)
    #expect(Note.e + .sixth(.diminished()) == .c.flat())
    #expect(Note.e + .sixth(.diminished(times: 2)) == .c.flat(2))
    #expect(Note.e + .sixth(.major) == .c.sharp())
    #expect(Note.e + .sixth(.augmented()) == .c.sharp(2))
    #expect(Note.e + .sixth(.augmented(times: 2)) == .c.sharp(3))

    #expect(Note.e + .seventh(.minor) == .d)
    #expect(Note.e + .seventh(.diminished()) == .d.flat())
    #expect(Note.e + .seventh(.diminished(times: 2)) == .d.flat(2))
    #expect(Note.e + .seventh(.major) == .d.sharp())
    #expect(Note.e + .seventh(.augmented()) == .d.sharp(2))
    #expect(Note.e + .seventh(.augmented(times: 2)) == .d.sharp(3))

    #expect(Note.e + .octave() == .e)
    #expect(Note.e + .octave(.augmented()) == .e.sharp())
    #expect(Note.e + .octave(.augmented(times: 2)) == .e.sharp(2))
    #expect(Note.e + .octave(.diminished()) == .e.flat())
    #expect(Note.e + .octave(.diminished(times: 2)) == .e.flat(2))
  }

  @Test func ESharpTranspositionUp() {
    #expect(Note.e.sharp() + .unison() == .e.sharp())
    #expect(Note.e.sharp() + .unison(.augmented()) == .e.sharp(2))
    #expect(Note.e.sharp() + .unison(.augmented(times: 2)) == .e.sharp(3))
    #expect(Note.e.sharp() + .unison(.diminished()) == .e)
    #expect(Note.e.sharp() + .unison(.diminished(times: 2)) == .e.flat())

    #expect(Note.e.sharp() + .second(.minor) == .f.sharp())
    #expect(Note.e.sharp() + .second(.diminished()) == .f)
    #expect(Note.e.sharp() + .second(.diminished(times: 2)) == .f.flat())
    #expect(Note.e.sharp() + .second(.major) == .f.sharp(2))
    #expect(Note.e.sharp() + .second(.augmented()) == .f.sharp(3))
    #expect(Note.e.sharp() + .second(.augmented(times: 2)) == Note(name: .f, accidental: .sharpened(times: 4)))

    #expect(Note.e.sharp() + .third(.minor) == .g.sharp())
    #expect(Note.e.sharp() + .third(.diminished()) == .g)
    #expect(Note.e.sharp() + .third(.diminished(times: 2)) == .g.flat())
    #expect(Note.e.sharp() + .third(.major) == .g.sharp(2))
    #expect(Note.e.sharp() + .third(.augmented()) == .g.sharp(3))
    #expect(Note.e.sharp() + .third(.augmented(times: 2)) == Note(name: .g, accidental: .sharpened(times: 4)))

    #expect(Note.e.sharp() + .fourth(.perfect) == .a.sharp())
    #expect(Note.e.sharp() + .fourth(.diminished()) == .a)
    #expect(Note.e.sharp() + .fourth(.augmented()) == .a.sharp(2))
    #expect(Note.e.sharp() + .fourth(.diminished(times: 2)) == .a.flat())
    #expect(Note.e.sharp() + .fourth(.augmented(times: 2)) == .a.sharp(3))

    #expect(Note.e.sharp() + .fifth(.perfect) == .b.sharp())
    #expect(Note.e.sharp() + .fifth(.diminished()) == .b)
    #expect(Note.e.sharp() + .fifth(.augmented()) == .b.sharp(2))
    #expect(Note.e.sharp() + .fifth(.diminished(times: 2)) == .b.flat())
    #expect(Note.e.sharp() + .fifth(.augmented(times: 2)) == .b.sharp(3))

    #expect(Note.e.sharp() + .sixth(.minor) == .c.sharp())
    #expect(Note.e.sharp() + .sixth(.diminished()) == .c)
    #expect(Note.e.sharp() + .sixth(.diminished(times: 2)) == .c.flat())
    #expect(Note.e.sharp() + .sixth(.major) == .c.sharp(2))
    #expect(Note.e.sharp() + .sixth(.augmented()) == .c.sharp(3))
    #expect(Note.e.sharp() + .sixth(.augmented(times: 2)) == Note(name: .c, accidental: .sharpened(times: 4)))

    #expect(Note.e.sharp() + .seventh(.minor) == .d.sharp())
    #expect(Note.e.sharp() + .seventh(.diminished()) == .d)
    #expect(Note.e.sharp() + .seventh(.diminished(times: 2)) == .d.flat())
    #expect(Note.e.sharp() + .seventh(.major) == .d.sharp(2))
    #expect(Note.e.sharp() + .seventh(.augmented()) == .d.sharp(3))
    #expect(Note.e.sharp() + .seventh(.augmented(times: 2)) == Note(name: .d, accidental: .sharpened(times: 4)))

    #expect(Note.e.sharp() + .octave() == .e.sharp())
    #expect(Note.e.sharp() + .octave(.augmented()) == .e.sharp(2))
    #expect(Note.e.sharp() + .octave(.diminished()) == .e)
  }

  @Test func EFlatTranspositionUp() {
    #expect(Note.e.flat() + .unison() == .e.flat())
    #expect(Note.e.flat() + .unison(.augmented()) == .e)
    #expect(Note.e.flat() + .unison(.augmented(times: 2)) == .e.sharp())
    #expect(Note.e.flat() + .unison(.diminished()) == .e.flat(2))
    #expect(Note.e.flat() + .unison(.diminished(times: 2)) == .e.flat(3))

    #expect(Note.e.flat() + .second(.minor) == .f.flat())
    #expect(Note.e.flat() + .second(.diminished()) == .f.flat(2))
    #expect(Note.e.flat() + .second(.diminished(times: 2)) == .f.flat(3))
    #expect(Note.e.flat() + .second(.major) == .f)
    #expect(Note.e.flat() + .second(.augmented()) == .f.sharp())
    #expect(Note.e.flat() + .second(.augmented(times: 2)) == .f.sharp(2))

    #expect(Note.e.flat() + .third(.minor) == .g.flat())
    #expect(Note.e.flat() + .third(.diminished()) == .g.flat(2))
    #expect(Note.e.flat() + .third(.diminished(times: 2)) == .g.flat(3))
    #expect(Note.e.flat() + .third(.major) == .g)
    #expect(Note.e.flat() + .third(.augmented()) == .g.sharp())
    #expect(Note.e.flat() + .third(.augmented(times: 2)) == .g.sharp(2))

    #expect(Note.e.flat() + .fourth(.perfect) == .a.flat())
    #expect(Note.e.flat() + .fourth(.diminished()) == .a.flat(2))
    #expect(Note.e.flat() + .fourth(.diminished(times: 2)) == .a.flat(3))
    #expect(Note.e.flat() + .fourth(.augmented()) == .a)
    #expect(Note.e.flat() + .fourth(.augmented(times: 2)) == .a.sharp())

    #expect(Note.e.flat() + .fifth(.perfect) == .b.flat())
    #expect(Note.e.flat() + .fifth(.diminished()) == .b.flat(2))
    #expect(Note.e.flat() + .fifth(.diminished(times: 2)) == .b.flat(3))
    #expect(Note.e.flat() + .fifth(.augmented()) == .b)
    #expect(Note.e.flat() + .fifth(.augmented(times: 2)) == .b.sharp())

    #expect(Note.e.flat() + .sixth(.minor) == .c.flat())
    #expect(Note.e.flat() + .sixth(.diminished()) == .c.flat(2))
    #expect(Note.e.flat() + .sixth(.diminished(times: 2)) == .c.flat(3))
    #expect(Note.e.flat() + .sixth(.major) == .c)
    #expect(Note.e.flat() + .sixth(.augmented()) == .c.sharp())
    #expect(Note.e.flat() + .sixth(.augmented(times: 2)) == .c.sharp(2))

    #expect(Note.e.flat() + .seventh(.minor) == .d.flat())
    #expect(Note.e.flat() + .seventh(.diminished()) == .d.flat(2))
    #expect(Note.e.flat() + .seventh(.diminished(times: 2)) == .d.flat(3))
    #expect(Note.e.flat() + .seventh(.major) == .d)
    #expect(Note.e.flat() + .seventh(.augmented()) == .d.sharp())
    #expect(Note.e.flat() + .seventh(.augmented(times: 2)) == .d.sharp(2))

    #expect(Note.e.flat() + .octave() == .e.flat())
    #expect(Note.e.flat() + .octave(.augmented()) == .e)
    #expect(Note.e.flat() + .octave(.augmented(times: 2)) == .e.sharp())
    #expect(Note.e.flat() + .octave(.diminished()) == .e.flat(2))
    #expect(Note.e.flat() + .octave(.diminished(times: 2)) == .e.flat(3))
  }
}
