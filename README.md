# ARSpeechActivity

`ARSpeechActivity` is a `UIActivity` subclass that provides a "Read" action to a `UIActivityViewController`.

![ARSpeechActivity screenshot](https://raw.github.com/alexruperez/ARSpeechActivity/master/screenshot.png "ARSpeechActivity screenshot")

## Requirements

- As `UIActivity` is iOS >= 6 only, so is the subclass.
- This project uses ARC. If you want to use it in a non ARC project, you must add the `-fobjc-arc` compiler flag to ARChromeActivity.m in Target Settings > Build Phases > Compile Sources.

## Installation

Add the `ARSpeechActivity` subfolder to your project. Add the `AVFoundation` framework to your proyect.

## Usage

*(See example Xcode project)*

Simply `alloc`/`init` an instance of `ARSpeechActivity` and pass that object into the applicationActivities array when creating a `UIActivityViewController`.

```objectivec
NSString *textToRead = @"Hello World!";
ARSpeechActivity *speechActivity = [[ARSpeechActivity alloc] init];
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[textToRead] applicationActivities:@[speechActivity]];
	[self presentViewController:activityVC animated:YES completion:nil];
```

Note that you can include the activity in any UIActivityViewController and it will only be shown to the user if there is a NSString in the activity items.
