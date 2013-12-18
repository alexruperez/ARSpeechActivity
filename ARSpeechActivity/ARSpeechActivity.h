//
//  ARSpeechActivity.h
//  ARSpeechActivity
//
//  Created by Alex Rupérez on 18/12/13.
//  Copyright (c) 2013 Alex Rupérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ARSpeechActivity : UIActivity

@property(nonatomic, assign) id<AVSpeechSynthesizerDelegate> synthesizerDelegate;

/* If no voice is specified, the system's default will be used. */
@property(nonatomic, retain) AVSpeechSynthesisVoice *voice;

@property(nonatomic) float rate;             // Values are pinned between AVSpeechUtteranceMinimumSpeechRate and AVSpeechUtteranceMaximumSpeechRate. Default = 0.1
@property(nonatomic) float pitchMultiplier;  // [0.5 - 2] Default = 1
@property(nonatomic) float volume;           // [0 - 1] Default = 1

@property(nonatomic) NSTimeInterval preUtteranceDelay;    // Default is 0.0
@property(nonatomic) NSTimeInterval postUtteranceDelay;   // Default is 0.0

@end
