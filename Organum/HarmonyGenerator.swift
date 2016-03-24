import MusicKit

struct HarmonyGenerator {
    static let Noah: () -> Harmonizer = { _ in
        let harmonies = [
            Major.I,
            Major.ii,
            Major.iii,
            Major.IV,
            Major.V,
            Major.vi,
            Major.bIII,
            Major.iv,
            Major.v,
            Major.bVI,
            Major.bVII,
            Major.i,
            Major.VI,
            Major.vii,
            Major.bii,
            Major.II,
            Major.III,
            Major.siv,
            ]
        return harmonies.randomElement
    }

    private enum Extension: Float {
        case None = 0
        case Sus2 = 2
        case Sus4 = 5
        case FlatSeven = 10
        case Seven = 11

        static var random: Extension {
            let extensions: [Extension] = [
                .None,
//                .Sus2,
//                .Sus4,
                .FlatSeven,
//                .Seven
            ]
            return extensions.randomElement
        }
    }

    static let NoahExtended: () -> Harmonizer = { _ in
        let extender: PitchSet -> PitchSet = { pitchSet in
            var out = pitchSet
            let first = pitchSet.first!
            let e = Extension.random
            if e == .Sus2 || e == .Sus4 {
                out.removeAtIndex(1)
            }
            out.insert(Pitch(midi: first.midi + e.rawValue))
            return out
        }
        let h = Noah()
        return { extender(h*$0) }
    }
}
