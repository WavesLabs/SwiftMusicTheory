import Testing
import SwiftMusicTheory
import Foundation

final class BTests {
  
  @Test func BTranspositionUp() {
    #expect(Note.b + .unison() == .b)
    #expect(Note.b + .unison(.augmented()) == .b.sharp())
    #expect(Note.b + .unison(.augmented(times: 2)) == .b.sharp(2))
    #expect(Note.b + .unison(.diminished()) == .b.flat())
    #expect(Note.b + .unison(.diminished(times: 2)) == .b.flat(2))

    #expect(Note.b + .second(.minor) == .c)
    #expect(Note.b + .second(.diminished()) == .c.flat())
    #expect(Note.b + .second(.major) == .c.sharp())
    #expect(Note.b + .second(.augmented()) == .c.sharp(2))
    #expect(Note.b + .second(.augmented(times: 2)) == .c.sharp(3))

    #expect(Note.b + .third(.minor) == .d)
    #expect(Note.b + .third(.diminished()) == .d.flat())
    #expect(Note.b + .third(.major) == .d.sharp())
    #expect(Note.b + .third(.augmented()) == .d.sharp(2))
    #expect(Note.b + .third(.augmented(times: 2)) == .d.sharp(3))

    #expect(Note.b + .fourth(.perfect) == .e)
    #expect(Note.b + .fourth(.diminished()) == .e.flat())
    #expect(Note.b + .fourth(.augmented()) == .e.sharp())
    #expect(Note.b + .fourth(.augmented(times: 2)) == .e.sharp(2))

    #expect(Note.b + .fifth(.perfect) == .f.sharp())
    #expect(Note.b + .fifth(.diminished()) == .f)
    #expect(Note.b + .fifth(.augmented()) == .f.sharp(2))
    #expect(Note.b + .fifth(.augmented(times: 2)) == .f.sharp(3))

    #expect(Note.b + .sixth(.minor) == .g)
    #expect(Note.b + .sixth(.diminished()) == .g.flat())
    #expect(Note.b + .sixth(.major) == .g.sharp())
    #expect(Note.b + .sixth(.augmented()) == .g.sharp(2))
    #expect(Note.b + .sixth(.augmented(times: 2)) == .g.sharp(3))

    #expect(Note.b + .seventh(.minor) == .a)
    #expect(Note.b + .seventh(.diminished()) == .a.flat())
    #expect(Note.b + .seventh(.major) == .a.sharp())
    #expect(Note.b + .seventh(.augmented()) == .a.sharp(2))
    #expect(Note.b + .seventh(.augmented(times: 2)) == .a.sharp(3))

    #expect(Note.b + .octave() == .b)
    #expect(Note.b + .octave(.augmented()) == .b.sharp())
    #expect(Note.b + .octave(.diminished()) == .b.flat())
  }

  @Test func BSharpTranspositionUp() {
    #expect(Note.b.sharp() + .unison() == .b.sharp())
    #expect(Note.b.sharp() + .unison(.augmented()) == .b.sharp(2))
    #expect(Note.b.sharp() + .unison(.augmented(times: 2)) == .b.sharp(3))
    #expect(Note.b.sharp() + .unison(.diminished()) == .b)
    #expect(Note.b.sharp() + .unison(.diminished(times: 2)) == .b.flat())

    #expect(Note.b.sharp() + .second(.minor) == .c.sharp())
    #expect(Note.b.sharp() + .second(.diminished()) == .c)
    #expect(Note.b.sharp() + .second(.major) == .c.sharp(2))
    #expect(Note.b.sharp() + .second(.augmented()) == .c.sharp(3))
    #expect(Note.b.sharp() + .second(.augmented(times: 2)) == Note(name: .c, accidental: .sharpened(times: 4)))

    #expect(Note.b.sharp() + .third(.minor) == .d.sharp())
    #expect(Note.b.sharp() + .third(.diminished()) == .d)
    #expect(Note.b.sharp() + .third(.major) == .d.sharp(2))
    #expect(Note.b.sharp() + .third(.augmented()) == .d.sharp(3))
    #expect(Note.b.sharp() + .third(.augmented(times: 2)) == Note(name: .d, accidental: .sharpened(times: 4)))

    #expect(Note.b.sharp() + .fourth(.perfect) == .e.sharp())
    #expect(Note.b.sharp() + .fourth(.diminished()) == .e)
    #expect(Note.b.sharp() + .fourth(.augmented()) == .e.sharp(2))
    #expect(Note.b.sharp() + .fourth(.augmented(times: 2)) == .e.sharp(3))

    #expect(Note.b.sharp() + .fifth(.perfect) == .f.sharp(2))
    #expect(Note.b.sharp() + .fifth(.diminished()) == .f.sharp())
    #expect(Note.b.sharp() + .fifth(.augmented()) == .f.sharp(3))
    #expect(Note.b.sharp() + .fifth(.augmented(times: 2)) == Note(name: .f, accidental: .sharpened(times: 4)))

    #expect(Note.b.sharp() + .sixth(.minor) == .g.sharp())
    #expect(Note.b.sharp() + .sixth(.diminished()) == .g)
    #expect(Note.b.sharp() + .sixth(.major) == .g.sharp(2))
    #expect(Note.b.sharp() + .sixth(.augmented()) == .g.sharp(3))
    #expect(Note.b.sharp() + .sixth(.augmented(times: 2)) == Note(name: .g, accidental: .sharpened(times: 4)))

    #expect(Note.b.sharp() + .seventh(.minor) == .a.sharp())
    #expect(Note.b.sharp() + .seventh(.diminished()) == .a)
    #expect(Note.b.sharp() + .seventh(.major) == .a.sharp(2))
    #expect(Note.b.sharp() + .seventh(.augmented()) == .a.sharp(3))
    #expect(Note.b.sharp() + .seventh(.augmented(times: 2)) == Note(name: .a, accidental: .sharpened(times: 4)))

    #expect(Note.b.sharp() + .octave() == .b.sharp())
    #expect(Note.b.sharp() + .octave(.augmented()) == .b.sharp(2))
    #expect(Note.b.sharp() + .octave(.diminished()) == .b)

  }

  @Test func BFlatTranspositionUp() {
    #expect(Note.b.flat() + .unison() == .b.flat())
    #expect(Note.b.flat() + .unison(.augmented()) == .b)
    #expect(Note.b.flat() + .unison(.augmented(times: 2)) == .b.sharp())
    #expect(Note.b.flat() + .unison(.diminished()) == .b.flat(2))
    #expect(Note.b.flat() + .unison(.diminished(times: 2)) == .b.flat(3))

    #expect(Note.b.flat() + .second(.minor) == .c.flat())
    #expect(Note.b.flat() + .second(.diminished()) == .c.flat(2))
    #expect(Note.b.flat() + .second(.major) == .c)
    #expect(Note.b.flat() + .second(.augmented()) == .c.sharp())
    #expect(Note.b.flat() + .second(.augmented(times: 2)) == .c.sharp(2))

    #expect(Note.b.flat() + .third(.minor) == .d.flat())
    #expect(Note.b.flat() + .third(.diminished()) == .d.flat(2))
    #expect(Note.b.flat() + .third(.major) == .d)
    #expect(Note.b.flat() + .third(.augmented()) == .d.sharp())
    #expect(Note.b.flat() + .third(.augmented(times: 2)) == .d.sharp(2))

    #expect(Note.b.flat() + .fourth(.perfect) == .e.flat())
    #expect(Note.b.flat() + .fourth(.diminished()) == .e.flat(2))
    #expect(Note.b.flat() + .fourth(.augmented()) == .e)
    #expect(Note.b.flat() + .fourth(.augmented(times: 2)) == .e.sharp())

    #expect(Note.b.flat() + .fifth(.perfect) == .f)
    #expect(Note.b.flat() + .fifth(.diminished()) == .f.flat())
    #expect(Note.b.flat() + .fifth(.augmented()) == .f.sharp())
    #expect(Note.b.flat() + .fifth(.augmented(times: 2)) == .f.sharp(2))

    #expect(Note.b.flat() + .sixth(.minor) == .g.flat())
    #expect(Note.b.flat() + .sixth(.diminished()) == .g.flat(2))
    #expect(Note.b.flat() + .sixth(.major) == .g)
    #expect(Note.b.flat() + .sixth(.augmented()) == .g.sharp())
    #expect(Note.b.flat() + .sixth(.augmented(times: 2)) == .g.sharp(2))

    #expect(Note.b.flat() + .seventh(.minor) == .a.flat())
    #expect(Note.b.flat() + .seventh(.diminished()) == .a.flat(2))
    #expect(Note.b.flat() + .seventh(.major) == .a)
    #expect(Note.b.flat() + .seventh(.augmented()) == .a.sharp())
    #expect(Note.b.flat() + .seventh(.augmented(times: 2)) == .a.sharp(2))

    #expect(Note.b.flat() + .octave() == .b.flat())
    #expect(Note.b.flat() + .octave(.augmented()) == .b)
    #expect(Note.b.flat() + .octave(.diminished()) == .b.flat(2))

  }
}
