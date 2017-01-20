//
//  QuestionViewController.m
//  QuizMaster
//
//  Created by Juliana Strawn on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import "QuestionViewController.h"

#if 0
@interface QuestionViewController ()

@property (strong, nonatomic) GameEngine *gameEngine;

@end
#endif

@implementation QuestionViewController
{
    GameEngine *_gameEngine;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _gameEngine = [[GameEngine alloc] init];
    _gameEngine.delegate = self;
    [_gameEngine loadQuestion];
    
    self.soundON = YES;
    
    // play Jeopardy Think song
    self.soundFilePath = [NSString stringWithFormat:@"%@/JeopardyThinkMusic.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:self.soundFilePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    self.audioPlayer.numberOfLoops = -1;
    [self.audioPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)audioButtonTapped:(UIButton *)sender {
    
    if(self.soundON) {
        [self.audioButtonTapped setImage:[UIImage imageNamed:@"audioOFF-icon.png"] forState:UIControlStateNormal];
        [self.audioPlayer stop];
        self.soundON = NO;
    } else  {
        [self.audioButtonTapped setImage:[UIImage imageNamed:@"audioON-icon.png"] forState:UIControlStateNormal];
        [self.audioPlayer play];
        self.soundON = YES;
    }

    
}

-(void)didFinishLoadingQuestion {
    self.currentScore.text = [NSString stringWithFormat:@"$%ld", (long)_gameEngine.questionValue];
}

- (IBAction)endGame:(id)sender {
}
@end
