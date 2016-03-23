//
//  File.swift
//  Continuo
//
//  Created by Ben Guo on 3/23/16.
//  Copyright © 2016 othernet. All rights reserved.
//

import UIKit
import MusicKit

struct MainViewModel {

    var chroma: Chroma = Chroma.C
    var octave: UInt = 5
    var harmonySet: [Harmonizer] = HarmonySet.Noah

    var contents: [Harmonizer] = []

}
