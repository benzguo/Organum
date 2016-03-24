//
//  NoteBuffer.swift
//  Organum
//
//  Created by Ben Guo on 3/23/16.
//  Copyright © 2016 othernet. All rights reserved.
//

import MusicKit
import AudioKit

class NoteBuffer {

    let chordSynth = AKWavetableSynth(waveform: AKTable(.Triangle), voiceCount: 5)
    let bassSynth = AKWavetableSynth(waveform: AKTable(.Sine), voiceCount: 5)
    let mixer: AKMixer

    init() {
        mixer = AKMixer(chordSynth, bassSynth)
        AudioKit.output = mixer
    }

    func on(pitches: PitchSet) {
        if let bass = pitches.first() {
            bassSynth.playNote(Int(bass.transpose(-12).midi), velocity: 100)
        }
        for pitch in pitches {
            chordSynth.playNote(Int(pitch.midi), velocity: 100)
        }
    }

    func off(pitches: PitchSet) {
        if let bass = pitches.first() {
            bassSynth.stopNote(Int(bass.transpose(-12).midi))
        }
        for pitch in pitches {
            let midi = Int(pitch.midi)
            chordSynth.stopNote(midi)
        }
    }

}
