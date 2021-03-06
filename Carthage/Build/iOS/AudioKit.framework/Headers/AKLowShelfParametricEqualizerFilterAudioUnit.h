//
//  AKLowShelfParametricEqualizerFilterAudioUnit.h
//  AudioKit
//
//  Created by Aurelius Prochazka, revision history on Github.
//  Copyright (c) 2016 Aurelius Prochazka. All rights reserved.
//

#ifndef AKLowShelfParametricEqualizerFilterAudioUnit_h
#define AKLowShelfParametricEqualizerFilterAudioUnit_h

#import <AudioToolbox/AudioToolbox.h>

@interface AKLowShelfParametricEqualizerFilterAudioUnit : AUAudioUnit
- (void)start;
- (void)stop;
- (BOOL)isPlaying;
- (void)setUpParameterRamp;

@property double inertia;

@end

#endif /* AKLowShelfParametricEqualizerFilterAudioUnit_h */
