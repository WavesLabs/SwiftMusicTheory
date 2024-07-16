import Testing
import SwiftMusicTheory
import Foundation

final class DTests {

  @Test func DTranspositionUp() {
    #expect(Note.d + .unison() == .d)
    #expect(Note.d + .unison(.augmented()) == .d.sharp())
    #expect(Note.d + .unison(.augmented(times: 2)) == .d.sharp(2))
    #expect(Note.d + .unison(.diminished()) == .d.flat())
    #expect(Note.d + .unison(.diminished(times: 2)) == .d.flat(2))

    #expect(Note.d + .second(.minor) == .e.flat())
    #expect(Note.d + .second(.diminished()) == .e.flat(2))
    #expect(Note.d + .second(.diminished(times: 2)) == .e.flat(3))
    #expect(Note.d + .second(.major) == .e)
    #expect(Note.d + .second(.augmented()) == .e.sharp())
    #expect(Note.d + .second(.augmented(times: 2)) == .e.sharp(2))

    #expect(Note.d + .third(.minor) == .f)
    #expect(Note.d + .third(.diminished()) == .f.flat())
    #expect(Note.d + .third(.diminished(times: 2)) == .f.flat(2))
    #expect(Note.d + .third(.major) == .f.sharp())
    #expect(Note.d + .third(.augmented()) == .f.sharp(2))
    #expect(Note.d + .third(.augmented(times: 2)) == .f.sharp(3))

    #expect(Note.d + .fourth(.perfect) == .g)
    #expect(Note.d + .fourth(.diminished()) == .g.flat())
    #expect(Note.d + .fourth(.diminished(times: 2)) == .g.flat(2))
    #expect(Note.d + .fourth(.augmented()) == .g.sharp())
    #expect(Note.d + .fourth(.augmented(times: 2)) == .g.sharp(2))

    #expect(Note.d + .fifth(.perfect) == .a)
    #expect(Note.d + .fifth(.diminished()) == .a.flat())
    #expect(Note.d + .fifth(.diminished(times: 2)) == .a.flat(2))
    #expect(Note.d + .fifth(.augmented()) == .a.sharp())
    #expect(Note.d + .fifth(.augmented(times: 2)) == .a.sharp(2))

    #expect(Note.d + .sixth(.minor) == .b.flat())
    #expect(Note.d + .sixth(.diminished()) == .b.flat(2))
    #expect(Note.d + .sixth(.diminished(times: 2)) == .b.flat(3))
    #expect(Note.d + .sixth(.major) == .b)
    #expect(Note.d + .sixth(.augmented()) == .b.sharp())
    #expect(Note.d + .sixth(.augmented(times: 2)) == .b.sharp(2))

    #expect(Note.d + .seventh(.minor) == .c)
    #expect(Note.d + .seventh(.diminished()) == .c.flat())
    #expect(Note.d + .seventh(.diminished(times: 2)) == .c.flat(2))
    #expect(Note.d + .seventh(.major) == .c.sharp())
    #expect(Note.d + .seventh(.augmented()) == .c.sharp(2))
    #expect(Note.d + .seventh(.augmented(times: 2)) == .c.sharp(3))

    #expect(Note.d + .octave() == .d)
    #expect(Note.d + .octave(.augmented()) == .d.sharp())
    #expect(Note.d + .octave(.augmented(times: 2)) == .d.sharp(2))
    #expect(Note.d + .octave(.diminished()) == .d.flat())
    #expect(Note.d + .octave(.diminished(times: 2)) == .d.flat(2))
  }

  @Test func DSharpTranspositionUpForDSharp() {
    #expect(Note.d.sharp() + .unison() == .d.sharp())
    #expect(Note.d.sharp() + .unison(.augmented()) == .d.sharp(2))
    #expect(Note.d.sharp() + .unison(.augmented(times: 2)) == .d.sharp(3))
    #expect(Note.d.sharp() + .unison(.diminished()) == .d)
    #expect(Note.d.sharp() + .unison(.diminished(times: 2)) == .d.flat())

    #expect(Note.d.sharp() + .second(.major) == .e.sharp())
    #expect(Note.d.sharp() + .second(.minor) == .e)
    #expect(Note.d.sharp() + .second(.diminished()) == .e.flat())
    #expect(Note.d.sharp() + .second(.diminished(times: 2)) == .e.flat(2))
    #expect(Note.d.sharp() + .second(.augmented()) == .e.sharp(2))
    #expect(Note.d.sharp() + .second(.augmented(times: 2)) == .e.sharp(3))

    #expect(Note.d.sharp() + .third(.major) == .f.sharp(2))
    #expect(Note.d.sharp() + .third(.minor) == .f.sharp())
    #expect(Note.d.sharp() + .third(.diminished()) == .f)
    #expect(Note.d.sharp() + .third(.diminished(times: 2)) == .f.flat())
    #expect(Note.d.sharp() + .third(.augmented()) == .f.sharp(3))
    #expect(Note.d.sharp() + .third(.augmented(times: 2)) == Note(name: .f, accidental: .sharpened(times: 4)))

    #expect(Note.d.sharp() + .fourth(.perfect) == .g.sharp())
    #expect(Note.d.sharp() + .fourth(.diminished()) == .g)
    #expect(Note.d.sharp() + .fourth(.diminished(times: 2)) == .g.flat())
    #expect(Note.d.sharp() + .fourth(.augmented()) == .g.sharp(2))
    #expect(Note.d.sharp() + .fourth(.augmented(times: 2)) == .g.sharp(3))

    #expect(Note.d.sharp() + .fifth(.perfect) == .a.sharp())
    #expect(Note.d.sharp() + .fifth(.diminished()) == .a)
    #expect(Note.d.sharp() + .fifth(.diminished(times: 2)) == .a.flat())
    #expect(Note.d.sharp() + .fifth(.augmented()) == .a.sharp(2))
    #expect(Note.d.sharp() + .fifth(.augmented(times: 2)) == .a.sharp(3))

    #expect(Note.d.sharp() + .sixth(.major) == .b.sharp())
    #expect(Note.d.sharp() + .sixth(.minor) == .b)
    #expect(Note.d.sharp() + .sixth(.diminished()) == .b.flat())
    #expect(Note.d.sharp() + .sixth(.diminished(times: 2)) == .b.flat(2))
    #expect(Note.d.sharp() + .sixth(.augmented()) == .b.sharp(2))
    #expect(Note.d.sharp() + .sixth(.augmented(times: 2)) == .b.sharp(3))

    #expect(Note.d.sharp() + .seventh(.major) == .c.sharp(2))
    #expect(Note.d.sharp() + .seventh(.minor) == .c.sharp())
    #expect(Note.d.sharp() + .seventh(.diminished()) == .c)
    #expect(Note.d.sharp() + .seventh(.diminished(times: 2)) == .c.flat())
    #expect(Note.d.sharp() + .seventh(.augmented()) == .c.sharp(3))
    #expect(Note.d.sharp() + .seventh(.augmented(times: 2)) == Note(name: .c, accidental: .sharpened(times: 4)))

    #expect(Note.d.sharp() + .octave() == .d.sharp())
    #expect(Note.d.sharp() + .octave(.augmented()) == .d.sharp(2))
    #expect(Note.d.sharp() + .octave(.augmented(times: 2)) == .d.sharp(3))
    #expect(Note.d.sharp() + .octave(.diminished()) == .d)
    #expect(Note.d.sharp() + .octave(.diminished(times: 2)) == .d.flat())
  }

  @Test func DFlatTranspositionUp() {
    #expect(Note.d.flat() + .unison() == .d.flat())
    #expect(Note.d.flat() + .unison(.augmented()) == .d)
    #expect(Note.d.flat() + .unison(.augmented(times: 2)) == .d.sharp())
    #expect(Note.d.flat() + .unison(.diminished()) == .d.flat(2))
    #expect(Note.d.flat() + .unison(.diminished(times: 2)) == Note(name: .d, accidental: .flattened(times: 3)))

    #expect(Note.d.flat() + .second(.minor) == .e.flat(2))
    #expect(Note.d.flat() + .second(.diminished()) == Note(name: .e, accidental: .flattened(times: 3)))
    #expect(Note.d.flat() + .second(.major) == .e.flat())
    #expect(Note.d.flat() + .second(.augmented()) == .e)
    #expect(Note.d.flat() + .second(.augmented(times: 2)) == .e.sharp())

    #expect(Note.d.flat() + .third(.minor) == .f.flat())
    #expect(Note.d.flat() + .third(.diminished()) == .f.flat(2))
    #expect(Note.d.flat() + .third(.major) == .f)
    #expect(Note.d.flat() + .third(.augmented()) == .f.sharp())
    #expect(Note.d.flat() + .third(.augmented(times: 2)) == .f.sharp(2))

    #expect(Note.d.flat() + .fourth(.perfect) == .g.flat())
    #expect(Note.d.flat() + .fourth(.diminished()) == .g.flat(2))
    #expect(Note.d.flat() + .fourth(.augmented()) == .g)
    #expect(Note.d.flat() + .fourth(.augmented(times: 2)) == .g.sharp())

    #expect(Note.d.flat() + .fifth(.perfect) == .a.flat())
    #expect(Note.d.flat() + .fifth(.diminished()) == .a.flat(2))
    #expect(Note.d.flat() + .fifth(.augmented()) == .a)
    #expect(Note.d.flat() + .fifth(.augmented(times: 2)) == .a.sharp())

    #expect(Note.d.flat() + .sixth(.minor) == .b.flat(2))
    #expect(Note.d.flat() + .sixth(.diminished()) == Note(name: .b, accidental: .flattened(times: 3)))
    #expect(Note.d.flat() + .sixth(.major) == .b.flat())
    #expect(Note.d.flat() + .sixth(.augmented()) == .b)
    #expect(Note.d.flat() + .sixth(.augmented(times: 2)) == .b.sharp())

    #expect(Note.d.flat() + .seventh(.minor) == .c.flat())
    #expect(Note.d.flat() + .seventh(.diminished()) == .c.flat(2))
    #expect(Note.d.flat() + .seventh(.major) == .c)
    #expect(Note.d.flat() + .seventh(.augmented()) == .c.sharp())
    #expect(Note.d.flat() + .seventh(.augmented(times: 2)) == .c.sharp(2))

    #expect(Note.d.flat() + .octave() == .d.flat())
    #expect(Note.d.flat() + .octave(.augmented()) == .d)
    #expect(Note.d.flat() + .octave(.augmented(times: 2)) == .d.sharp())
    #expect(Note.d.flat() + .octave(.diminished()) == .d.flat(2))
    #expect(Note.d.flat() + .octave(.diminished(times: 2)) == Note(name: .d, accidental: .flattened(times: 3)))
  }
}
