import MusicKit

struct ChordCellModel {
    let pitchSet: PitchSet

    var chordDescriptor: ChordDescriptor? {
        return Chord.descriptor(pitchSet)
    }

    var chordName: String? {
        return Chord.name(pitchSet)
    }
}

