public typealias MIDINote = UInt8

import Foundation

public extension MIDINote {
  init(_ pitch: Pitch) {
    // MIDI counts semitones above C-1 (note 0) so we add one octave
    self = UInt8(pitch.semitonesFromC0 + Interval.octave().semitonesCount())
  }
}
