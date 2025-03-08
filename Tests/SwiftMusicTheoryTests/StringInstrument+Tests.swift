import Testing
import SwiftMusicTheory
import Foundation

final class StringInstrumentTests {
  
  let guitar = StringInstrument()

  @Test(arguments: [
    (string: 1, fret: 0, pitch: Note.e.octave(.oneLine)),
    (string: 1, fret: 1, pitch: Note.f.octave(.oneLine)),
    (string: 1, fret: 2, pitch: Note.g.flat().octave(.oneLine)),
    (string: 1, fret: 3, pitch: Note.g.octave(.oneLine)),
    (string: 1, fret: 4, pitch: Note.a.flat().octave(.oneLine)),
    (string: 1, fret: 5, pitch: Note.a.octave(.oneLine)),
    (string: 1, fret: 6, pitch: Note.b.flat().octave(.oneLine)),
    (string: 1, fret: 7, pitch: Note.b.octave(.oneLine)),
    (string: 1, fret: 8, pitch: Note.c.octave(.twoLine)),
    (string: 1, fret: 9, pitch: Note.d.flat().octave(.twoLine)),
    (string: 1, fret: 10, pitch: Note.d.octave(.twoLine)),
    (string: 1, fret: 11, pitch: Note.e.flat().octave(.twoLine)),
    (string: 1, fret: 12, pitch: Note.e.octave(.twoLine)),
    (string: 1, fret: 13, pitch: Note.f.octave(.twoLine)),
    (string: 1, fret: 14, pitch: Note.g.flat().octave(.twoLine)),
    (string: 1, fret: 15, pitch: Note.g.octave(.twoLine)),
    (string: 1, fret: 16, pitch: Note.a.flat().octave(.twoLine)),
    (string: 1, fret: 17, pitch: Note.a.octave(.twoLine)),
    (string: 1, fret: 18, pitch: Note.b.flat().octave(.twoLine)),
    (string: 1, fret: 19, pitch: Note.b.octave(.twoLine)),
    (string: 1, fret: 20, pitch: Note.c.octave(.threeLine)),
    (string: 1, fret: 21, pitch: Note.d.flat().octave(.threeLine)),
    (string: 1, fret: 22, pitch: Note.d.octave(.threeLine)),
    (string: 1, fret: 23, pitch: Note.e.flat().octave(.threeLine)),
    (string: 1, fret: 24, pitch: Note.e.octave(.threeLine)),
    
    (string: 2, fret: 0, pitch: Note.b.octave(.small)),
    (string: 2, fret: 1, pitch: Note.c.octave(.oneLine)),
    (string: 2, fret: 2, pitch: Note.d.flat().octave(.oneLine)),
    (string: 2, fret: 3, pitch: Note.d.octave(.oneLine)),
    (string: 2, fret: 4, pitch: Note.e.flat().octave(.oneLine)),
    (string: 2, fret: 5, pitch: Note.e.octave(.oneLine)),
    (string: 2, fret: 6, pitch: Note.f.octave(.oneLine)),
    (string: 2, fret: 7, pitch: Note.g.flat().octave(.oneLine)),
    (string: 2, fret: 8, pitch: Note.g.octave(.oneLine)),
    (string: 2, fret: 9, pitch: Note.a.flat().octave(.oneLine)),
    (string: 2, fret: 10, pitch: Note.a.octave(.oneLine)),
    (string: 2, fret: 11, pitch: Note.b.flat().octave(.oneLine)),
    (string: 2, fret: 12, pitch: Note.b.octave(.oneLine)),
    (string: 2, fret: 13, pitch: Note.c.octave(.twoLine)),
    (string: 2, fret: 14, pitch: Note.d.flat().octave(.twoLine)),
    (string: 2, fret: 15, pitch: Note.d.octave(.twoLine)),
    (string: 2, fret: 16, pitch: Note.e.flat().octave(.twoLine)),
    (string: 2, fret: 17, pitch: Note.e.octave(.twoLine)),
    (string: 2, fret: 18, pitch: Note.f.octave(.twoLine)),
    (string: 2, fret: 19, pitch: Note.g.flat().octave(.twoLine)),
    (string: 2, fret: 20, pitch: Note.g.octave(.twoLine)),
    (string: 2, fret: 21, pitch: Note.a.flat().octave(.twoLine)),
    (string: 2, fret: 22, pitch: Note.a.octave(.twoLine)),
    (string: 2, fret: 23, pitch: Note.b.flat().octave(.twoLine)),
    (string: 2, fret: 24, pitch: Note.b.octave(.twoLine)),
    
    (string: 3, fret: 0, pitch: Note.g.octave(.small)),
    (string: 4, fret: 0, pitch: Note.d.octave(.small)),
    (string: 5, fret: 0, pitch: Note.a.octave(.great)),
    (string: 6, fret: 0, pitch: Note.e.octave(.great)),
    (string: 6, fret: 12, pitch: Note.e.octave(.small)),
  ])
  func testFreqiencies(_ testCase: (string: StringInstrument.String, fret: StringInstrument.Fret, pitch: Pitch)) throws {
    
    let testingPitch = guitar.pitch(at: testCase.string, fret: testCase.fret)
    #expect(testingPitch.note == testCase.pitch.note)
    #expect(testingPitch.octave == testCase.pitch.octave)
  }
}
