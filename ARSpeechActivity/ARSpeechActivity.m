//
//  ARSpeechActivity.m
//  ARSpeechActivity
//
//  Created by Alex Rupérez on 18/12/13.
//  Copyright (c) 2013 Alex Rupérez. All rights reserved.
//

#import "ARSpeechActivity.h"

@interface ARSpeechActivity ()

@property (nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;
@property (nonatomic, strong) AVSpeechUtterance *speechUtterance;

- (AVSpeechSynthesisVoice *)voiceLanguageForText:(NSString *)text;

@end

@implementation ARSpeechActivity

- (id)init
{
    self = [super init];
    if (self) {
        self.speechSynthesizer = [AVSpeechSynthesizer new];
        self.rate = 0.1f;
        self.pitchMultiplier = 1.0f;
        self.volume = 1.0f;
        self.preUtteranceDelay = 0.0f;
        self.postUtteranceDelay = 0.0f;
    }
    return self;
}

+ (UIActivityCategory)activityCategory
{
    return UIActivityCategoryAction;
}

- (NSString *)activityType
{
    return NSStringFromClass([self class]);
}

- (UIImage *)activityImage {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return [UIImage imageNamed:[self.activityType stringByAppendingString:@"-iPad"]];
    } else {
        return [UIImage imageNamed:self.activityType];
    }
}

- (NSString *)activityTitle {
    return NSLocalizedStringFromTable(@"Read", NSStringFromClass([self class]), nil);
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSString class]]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSString class]]) {
            self.speechSynthesizer.delegate = self.synthesizerDelegate;
            self.speechUtterance = [[AVSpeechUtterance alloc] initWithString:activityItem];
            if (self.voice) {
                self.speechUtterance.voice = self.voice;
            } else {
                self.speechUtterance.voice = [self voiceLanguageForText:activityItem];
            }
            [self.speechUtterance setRate:self.rate];
            [self.speechUtterance setPitchMultiplier:self.pitchMultiplier];
            [self.speechUtterance setPreUtteranceDelay:self.preUtteranceDelay];
            [self.speechUtterance setPostUtteranceDelay:self.postUtteranceDelay];
        }
    }
}

- (void)performActivity
{
    bool completed = NO;
    if (self.speechUtterance) {
        [self.speechSynthesizer speakUtterance:self.speechUtterance];
        completed = YES;
    }
    
    [self activityDidFinish:completed];
}

/**
 * Language detection taken from Eric Wolfe's contribution to Hark https://github.com/kgn/Hark
 */
- (AVSpeechSynthesisVoice *)voiceLanguageForText:(NSString *)text
{
    CFRange range = CFRangeMake(0, MIN(400, text.length));
    NSString *currentLanguage = [AVSpeechSynthesisVoice currentLanguageCode];
    NSString *language = (NSString *)CFBridgingRelease(CFStringTokenizerCopyBestStringLanguage((CFStringRef)text, range));
    if(language && ![currentLanguage hasPrefix:language]){
        NSArray *availableLanguages = [[AVSpeechSynthesisVoice speechVoices] valueForKeyPath:@"language"];
        if([availableLanguages containsObject:language]){
            return [AVSpeechSynthesisVoice voiceWithLanguage:language];
        }
        
        // Fall back to searching for languages starting with the current language code
        NSString *languageCode = [[language componentsSeparatedByString:@"-"] firstObject];
        for(NSString *language in availableLanguages){
            if([language hasPrefix:languageCode]){
                return [AVSpeechSynthesisVoice voiceWithLanguage:language];
            }
        }
    }
    
    return [AVSpeechSynthesisVoice voiceWithLanguage:currentLanguage];
}

@end
