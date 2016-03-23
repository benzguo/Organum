import UIKit
import MusicKit

struct MainViewModel {

    var chroma: Chroma = Chroma.C
    var octave: Int = 4
    var harmonySet: [Harmonizer] = HarmonySet.Noah
    var harmonies: [Harmonizer] = []

    var pitchSets: [PitchSet] {
        return harmonies.map { $0(chroma*octave) }
    }

    var chordDescriptors: [ChordDescriptor] {
        return pitchSets.flatMap { Chord.descriptor($0) }
    }

    var chordNames: [String] {
        return pitchSets.flatMap { Chord.name($0) }
    }

    mutating func add() {
        harmonies.append(harmonySet.randomElement)
    }

}
