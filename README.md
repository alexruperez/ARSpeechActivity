# ARSpeechActivity

[![Twitter](http://img.shields.io/badge/contact-@alexruperez-blue.svg?style=flat)](http://twitter.com/alexruperez)
[![GitHub Issues](http://img.shields.io/github/issues/alexruperez/ARSpeechActivity.svg?style=flat)](http://github.com/alexruperez/ARSpeechActivity/issues)
[![Version](https://img.shields.io/cocoapods/v/ARSpeechActivity.svg?style=flat)](http://cocoadocs.org/docsets/ARSpeechActivity)
[![License](https://img.shields.io/cocoapods/l/ARSpeechActivity.svg?style=flat)](http://cocoadocs.org/docsets/ARSpeechActivity)
[![Platform](https://img.shields.io/cocoapods/p/ARSpeechActivity.svg?style=flat)](http://cocoadocs.org/docsets/ARSpeechActivity)
[![Analytics](https://ga-beacon.appspot.com/UA-55329295-1/ARSpeechActivity/readme?pixel)](https://github.com/igrigorik/ga-beacon)


`ARSpeechActivity` is a `UIActivity` subclass that provides a "Read" action to a `UIActivityViewController`.

![ARSpeechActivity screenshot](https://raw.github.com/alexruperez/ARSpeechActivity/master/screenshot.png "ARSpeechActivity screenshot")

## Requirements

- As `UIActivity` is iOS >= 6 only, so is the subclass.
- This project uses ARC. If you want to use it in a non ARC project, you must add the `-fobjc-arc` compiler flag to ARSpeechActivity.m in Target Settings > Build Phases > Compile Sources.

## Installation

Add the `ARSpeechActivity` subfolder to your project. Add the `AVFoundation` framework to your proyect.

## Usage

*(See example Xcode project)*

Simply `alloc`/`init` an instance of `ARSpeechActivity` and pass that object into the applicationActivities array when creating a `UIActivityViewController`.

```objectivec
NSString *textToRead = @"Hello World!";
ARSpeechActivity *speechActivity = [[ARSpeechActivity alloc] init];
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[textToRead] applicationActivities:@[speechActivity]];
	[self presentViewController:activityViewController animated:YES completion:nil];
```

Note that you can include the activity in any UIActivityViewController and it will only be shown to the user if there is a NSString in the activity items.
