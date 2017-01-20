//
//  ViewController.m
//  QuizMaster
//
//  Created by Alique Williams on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import "ViewController.h"

#define NSDEFAULT_KEY_SCORE     @"QuizMasterHighScore"


@interface ViewController ()

//@property (strong, nonatomic)

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // play Jeopardy Theme song
    
    self.soundFilePath = [NSString stringWithFormat:@"%@/JeopardyTheme.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:self.soundFilePath];
    
    self.questionViewController.soundFilePath = self.soundFilePath;
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    self.audioPlayer.numberOfLoops = -1;
    
    self.questionViewController.audioPlayer = self.audioPlayer;
    
    [self.audioPlayer play];
    
}

- (IBAction)startGame:(UIButton *)sender {
    [self.audioPlayer stop];

}


@end
