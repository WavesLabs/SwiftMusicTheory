import Testing
import SwiftMusicTheory
import Foundation

final class FTests {

  @Test func FTranspositionUp() {
    #expect(Note.f + .unison() == .f)
    #expect(Note.f + .unison(.augmented()) == .f.sharp())
    #expect(Note.f + .unison(.augmented(times: 2)) == .f.sharp(2))
    #expect(Note.f + .unison(.diminished()) == .f.flat())
    #expect(Note.f + .unison(.diminished(times: 2)) == .f.flat(2))

    #expect(Note.f + .second(.minor) == .g.flat())
    #expect(Note.f + .second(.diminished()) == .g.flat(2))
    #expect(Note.f + .second(.diminished(times: 2)) == .g.flat(3))
    #expect(Note.f + .second(.major) == .g)
    #expect(Note.f + .second(.augmented()) == .g.sharp())
    #expect(Note.f + .second(.augmented(times: 2)) == .g.sharp(2))

    #expect(Note.f + .third(.minor) == .a.flat())
    #expect(Note.f + .third(.diminished()) == .a.flat(2))
    #expect(Note.f + .third(.diminished(times: 2)) == .a.flat(3))
    #expect(Note.f + .third(.major) == .a)
    #expect(Note.f + .third(.augmented()) == .a.sharp())
    #expect(Note.f + .third(.augmented(times: 2)) == .a.sharp(2))
    
    #expect(Note.f + .fourth(.perfect) == .b.flat())
    #expect(Note.f + .fourth(.diminished()) == .b.flat(2))
    #expect(Note.f + .fourth(.diminished(times: 2)) == .b.flat(3))
    #expect(Note.f + .fourth(.augmented()) == .b)
    #expect(Note.f + .fourth(.augmented(times: 2)) == .b.sharp())

    #expect(Note.f + .fifth(.perfect) == .c)
    #expect(Note.f + .fifth(.diminished()) == .c.flat())
    #expect(Note.f + .fifth(.diminished(times: 2)) == .c.flat(2))
    #expect(Note.f + .fifth(.augmented()) == .c.sharp())
    #expect(Note.f + .fifth(.augmented(times: 2)) == .c.sharp(2))

    #expect(Note.f + .sixth(.minor) == .d.flat())
    #expect(Note.f + .sixth(.diminished()) == .d.flat(2))
    #expect(Note.f + .sixth(.diminished(times: 2)) == .d.flat(3))
    #expect(Note.f + .sixth(.major) == .d)
    #expect(Note.f + .sixth(.augmented()) == .d.sharp())
    #expect(Note.f + .sixth(.augmented(times: 2)) == .d.sharp(2))

    #expect(Note.f + .seventh(.minor) == .e.flat())
    #expect(Note.f + .seventh(.diminished()) == .e.flat(2))
    #expect(Note.f + .seventh(.diminished(times: 2)) == .e.flat(3))
    #expect(Note.f + .seventh(.major) == .e)
    #expect(Note.f + .seventh(.augmented()) == .e.sharp())
    #expect(Note.f + .seventh(.augmented(times: 2)) == .e.sharp(2))

    #expect(Note.f + .octave() == .f)
    #expect(Note.f + .octave(.augmented()) == .f.sharp())
    #expect(Note.f + .octave(.augmented(times: 2)) == .f.sharp(2))
    #expect(Note.f + .octave(.diminished()) == .f.flat())
    #expect(Note.f + .octave(.diminished(times: 2)) == .f.flat(2))
  }

  @Test func FSharpTranspositionUp() {
    #expect(Note.f.sharp() + .unison() == .f.sharp())
    #expect(Note.f.sharp() + .unison(.augmented()) == .f.sharp(2))
    #expect(Note.f.sharp() + .unison(.augmented(times: 2)) == .f.sharp(3))
    #expect(Note.f.sharp() + .unison(.diminished()) == .f)
    #expect(Note.f.sharp() + .unison(.diminished(times: 2)) == .f.flat())

    #expect(Note.f.sharp() + .second(.minor) == .g)
    #expect(Note.f.sharp() + .second(.diminished()) == .g.flat())
    #expect(Note.f.sharp() + .second(.diminished(times: 2)) == .g.flat(2))
    #expect(Note.f.sharp() + .second(.major) == .g.sharp())
    #expect(Note.f.sharp() + .second(.augmented()) == .g.sharp(2))
    #expect(Note.f.sharp() + .second(.augmented(times: 2)) == .g.sharp(3))

    #expect(Note.f.sharp() + .third(.minor) == .a)
    #expect(Note.f.sharp() + .third(.diminished()) == .a.flat())
    #expect(Note.f.sharp() + .third(.diminished(times: 2)) == .a.flat(2))
    #expect(Note.f.sharp() + .third(.major) == .a.sharp())
    #expect(Note.f.sharp() + .third(.augmented()) == .a.sharp(2))
    #expect(Note.f.sharp() + .third(.augmented(times: 2)) == .a.sharp(3))

    #expect(Note.f.sharp() + .fourth(.perfect) == .b)
    #expect(Note.f.sharp() + .fourth(.diminished()) == .b.flat())
    #expect(Note.f.sharp() + .fourth(.diminished(times: 2)) == .b.flat(2))
    #expect(Note.f.sharp() + .fourth(.augmented()) == .b.sharp())
    #expect(Note.f.sharp() + .fourth(.augmented(times: 2)) == .b.sharp(2))

    #expect(Note.f.sharp() + .fifth(.perfect) == .c.sharp())
    #expect(Note.f.sharp() + .fifth(.diminished()) == .c)
    #expect(Note.f.sharp() + .fifth(.diminished(times: 2)) == .c.flat())
    #expect(Note.f.sharp() + .fifth(.augmented()) == .c.sharp(2))
    #expect(Note.f.sharp() + .fifth(.augmented(times: 2)) == .c.sharp(3))

    #expect(Note.f.sharp() + .sixth(.minor) == .d)
    #expect(Note.f.sharp() + .sixth(.diminished()) == .d.flat())
    #expect(Note.f.sharp() + .sixth(.diminished(times: 2)) == .d.flat(2))
    #expect(Note.f.sharp() + .sixth(.major) == .d.sharp())
    #expect(Note.f.sharp() + .sixth(.augmented()) == .d.sharp(2))
    #expect(Note.f.sharp() + .sixth(.augmented(times: 2)) == .d.sharp(3))

    #expect(Note.f.sharp() + .seventh(.minor) == .e)
    #expect(Note.f.sharp() + .seventh(.diminished()) == .e.flat())
    #expect(Note.f.sharp() + .seventh(.diminished(times: 2)) == .e.flat(2))
    #expect(Note.f.sharp() + .seventh(.major) == .e.sharp())
    #expect(Note.f.sharp() + .seventh(.augmented()) == .e.sharp(2))
    #expect(Note.f.sharp() + .seventh(.augmented(times: 2)) == .e.sharp(3))

    #expect(Note.f.sharp() + .octave() == .f.sharp())
    #expect(Note.f.sharp() + .octave(.augmented()) == .f.sharp(2))
    #expect(Note.f.sharp() + .octave(.augmented(times: 2)) == .f.sharp(3))
    #expect(Note.f.sharp() + .octave(.diminished()) == .f)
    #expect(Note.f.sharp() + .octave(.diminished(times: 2)) == .f.flat())
  }

  @Test func FFlatTranspositionUp() {
    #expect(Note.f.flat() + .unison() == .f.flat())
    #expect(Note.f.flat() + .unison(.augmented()) == .f)
    #expect(Note.f.flat() + .unison(.augmented(times: 2)) == .f.sharp())
    #expect(Note.f.flat() + .unison(.diminished()) == .f.flat(2))
    #expect(Note.f.flat() + .unison(.diminished(times: 2)) == .f.flat(3))

    #expect(Note.f.flat() + .second(.minor) == .g.flat(2))
    #expect(Note.f.flat() + .second(.diminished()) == .g.flat(3))
    #expect(Note.f.flat() + .second(.major) == .g.flat())
    #expect(Note.f.flat() + .second(.augmented()) == .g)
    #expect(Note.f.flat() + .second(.augmented(times: 2)) == .g.sharp())

    #expect(Note.f.flat() + .third(.minor) == .a.flat(2))
    #expect(Note.f.flat() + .third(.diminished()) == .a.flat(3))
    #expect(Note.f.flat() + .third(.major) == .a.flat())
    #expect(Note.f.flat() + .third(.augmented()) == .a)
    #expect(Note.f.flat() + .third(.augmented(times: 2)) == .a.sharp())

    #expect(Note.f.flat() + .fourth(.perfect) == .b.flat(2))
    #expect(Note.f.flat() + .fourth(.diminished()) == .b.flat(3))
    #expect(Note.f.flat() + .fourth(.augmented()) == .b.flat())

    #expect(Note.f.flat() + .fifth(.perfect) == .c.flat())
    #expect(Note.f.flat() + .fifth(.diminished()) == .c.flat(2))
    #expect(Note.f.flat() + .fifth(.augmented()) == .c)

    #expect(Note.f.flat() + .sixth(.minor) == .d.flat(2))
    #expect(Note.f.flat() + .sixth(.diminished()) == .d.flat(3))
    #expect(Note.f.flat() + .sixth(.major) == .d.flat())
    #expect(Note.f.flat() + .sixth(.augmented()) == .d)

    #expect(Note.f.flat() + .seventh(.minor) == .e.flat(2))
    #expect(Note.f.flat() + .seventh(.diminished()) == .e.flat(3))
    #expect(Note.f.flat() + .seventh(.major) == .e.flat())
    #expect(Note.f.flat() + .seventh(.augmented()) == .e)

    #expect(Note.f.flat() + .octave() == .f.flat())
    #expect(Note.f.flat() + .octave(.augmented()) == .f)
    #expect(Note.f.flat() + .octave(.diminished()) == .f.flat(2))
    #expect(Note.f.flat() + .octave(.diminished(times: 2)) == .f.flat(3))
  }
}
