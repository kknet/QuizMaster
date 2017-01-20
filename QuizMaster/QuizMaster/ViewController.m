//
//  ViewController.m
//  QuizMaster
//
//  Created by Alique Williams on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import "ViewController.h"
#import "QuestionViewController.h"


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
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    self.audioPlayer.numberOfLoops = -1;
    [self.audioPlayer play];
    
}

- (IBAction)startGame:(UIButton *)sender {
//    UIStoryboard *storyboard = self.storyboard;
//    UIViewController *questionNAnswers = [storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];
//    [self presentViewController:questionNAnswers animated:true completion:nil];
//    
//    [self.navigationController
//     pushViewController:questionNAnswers
//     animated:YES];
//    
//    NSString * storyboardName = @"QuestionViewController";
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
//    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];
//    [self presentViewController:vc animated:YES completion:nil];

}


@end
