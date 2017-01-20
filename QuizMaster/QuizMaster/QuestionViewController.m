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
    self.currentScore.text = [NSString stringWithFormat:@"$%ld", (long)_gameEngine.currentScore];
    self.category.text = _gameEngine.categoryName;
    self.question.text = _gameEngine.question;
    self.questionValueLabel.text = [NSString stringWithFormat:@"$%ld", (long)_gameEngine.questionValue];
    
    [self.answer1 setTitle:_gameEngine.answerChoice1 forState:UIControlStateNormal];
    [self.answer2 setTitle:_gameEngine.answerChoice2 forState:UIControlStateNormal];
    [self.answer3 setTitle:_gameEngine.answerChoice3 forState:UIControlStateNormal];
    [self.answer4 setTitle:_gameEngine.answerChoice4 forState:UIControlStateNormal];
}

- (IBAction)endGame:(id)sender {
}
- (IBAction)answer1:(id)sender {
}

- (IBAction)answer2:(id)sender {
}

- (IBAction)answer3:(id)sender {
}

- (IBAction)answer4:(id)sender {
}
@end
