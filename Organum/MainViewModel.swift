import UIKit
import MusicKit

struct MainViewModel {

    var chroma: Chroma = Chroma.C
    var octave: Int = 4
    var harmonyGenerator = HarmonyGenerator.NoahExtended
    var cellModels: [ChordCellModel] = []

    mutating func add() {
        let chord = harmonyGenerator()*(chroma*octave)
        cellModels.append(ChordCellModel(pitchSet: chord))
    }

}
