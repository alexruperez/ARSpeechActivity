//
//  ARViewController.m
//  ARSpeechActivityDemo
//
//  Created by Alex Rupérez on 18/12/13.
//  Copyright (c) 2013 Alex Rupérez. All rights reserved.
//

#import "ARViewController.h"
#import "ARSpeechActivity.h"

@interface ARViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ARViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    self.textField = [[UITextField alloc] init];
    [self.textField setText:@"Hello, i will say everything you type here."];
    [self.textField setFrame:CGRectMake((screenSize.width/2)-135, (screenSize.height/2)-90, 270, 60)];
    [self.view addSubview:self.textField];
	
	UIButton *showActivitiesButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[showActivitiesButton setTitle:@"Show Activities" forState:UIControlStateNormal];
	[showActivitiesButton addTarget:self action:@selector(showActivities:) forControlEvents:UIControlEventTouchUpInside];
	[showActivitiesButton setFrame:CGRectMake((screenSize.width/2)-60, (screenSize.height/2)-30, 120, 60)];
    [self.view addSubview:showActivitiesButton];
}

- (void)showActivities:(id)sender {
	
	ARSpeechActivity *speechActivity = [[ARSpeechActivity alloc] init];
	
	UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.textField.text] applicationActivities:@[speechActivity]];
    [speechActivity setVoice:[AVSpeechSynthesisVoice voiceWithLanguage:@"en-us"]];
	
	[self presentViewController:activityVC animated:YES completion:nil];
}

@end
