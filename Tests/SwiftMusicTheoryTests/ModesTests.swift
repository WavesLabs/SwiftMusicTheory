import Testing
import SwiftMusicTheory
import Foundation

final class ModesTests {

  @Test func diatonic() {
    let cMajor = Mode(root: .c, scale: .diatonic)

    print(cMajor.relativeMode(at: 6))

    #expect(cMajor.root == .c)
    #expect(cMajor.notes == [.c, .d, .e, .f, .g, .a, .b])
    #expect(cMajor.name == "Major")
    #expect(cMajor.title == "C Major")
    #expect(cMajor.scale.name == "Diatonic")
    #expect(cMajor.parallelMode(at: 5).notes == [.c, .d, .e.flat(), .f, .g, .a.flat(), .b.flat()])
    #expect(cMajor.parallelMode(at: 5).name == "Minor")
    #expect(cMajor.parallelMode(at: 5).scale.name == "Diatonic")

    #expect(cMajor.relativeMode(at: .a)?.notes == [.a, .b, .c, .d, .e, .f, .g])
  }

  @Test func wholeTone() {
    let cWholeTone = Mode(root: .c, scale: .wholeTone)

    #expect(cWholeTone.root == .c)
    #expect(cWholeTone.notes == [.c, .d, .e, .f.sharp(), .g.sharp(), .a.sharp()])
    #expect(cWholeTone.relativeMode(at: .c)?.notes == [.c, .d, .e, .f.sharp(), .g.sharp(), .a.sharp()])
    #expect(cWholeTone.relativeMode(at: .d)?.notes == [.d, .e, .f.sharp(), .g.sharp(), .a.sharp(), .c])
    #expect(cWholeTone.relativeMode(at: .e)?.notes == [.e, .f.sharp(), .g.sharp(), .a.sharp(), .c, .d])
    #expect(cWholeTone.relativeMode(at: .f.sharp())?.notes == [.f.sharp(), .g.sharp(), .a.sharp(), .c, .d, .e])
    #expect(cWholeTone.relativeMode(at: .g.sharp())?.notes == [.g.sharp(), .a.sharp(), .c, .d, .e, .f.sharp()])
    #expect(cWholeTone.relativeMode(at: .a.sharp())?.notes == [.a.sharp(), .c, .d, .e, .f.sharp(), .g.sharp()])

    #expect(cWholeTone.parallelMode(at: 1).notes == [.c, .d, .e, .f.sharp(), .g.sharp(), .b.flat()])
    #expect(cWholeTone.parallelMode(at: 2).notes == [.c, .d, .e, .f.sharp(), .a.flat(), .b.flat()])
    #expect(cWholeTone.parallelMode(at: 3).notes == [.c, .d, .e, .g.flat(), .a.flat(), .b.flat()])
    #expect(cWholeTone.parallelMode(at: 4).notes == [.c, .d, .f.flat(), .g.flat(), .a.flat(), .b.flat()])
    #expect(cWholeTone.parallelMode(at: 5).notes == [.c, .e.flat(2), .f.flat(), .g.flat(), .a.flat(), .b.flat()])

    let bSharp = Mode(root: .b.sharp(), scale: .wholeTone)
    #expect(bSharp.notes == [.b.sharp(), .c.sharp(2), .d.sharp(2), .e.sharp(2), .f.sharp(3), .g.sharp(3)])

    let aSharp = Mode(root: .a.sharp(), scale: .wholeTone)
    #expect(aSharp.notes == [.a.sharp(), .b.sharp(), .c.sharp(2), .d.sharp(2), .e.sharp(2), .f.sharp(3)])
  }

  @Test func diminished() {
    let cDiminished = Mode(root: .c, scale: .diminished)

    #expect(cDiminished.root == .c)
    #expect(cDiminished.notes == [.c, .d, .e.flat(), .f, .f.sharp(), .g.sharp(), .a, .b])
  }
}
