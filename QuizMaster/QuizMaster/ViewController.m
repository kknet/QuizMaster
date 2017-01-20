//
//  ViewController.m
//  QuizMaster
//
//  Created by Alique Williams on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import "ViewController.h"


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
    
    [self displayHighScore];
}

- (IBAction)startGame:(UIButton *)sender {
    [self.audioPlayer stop];

}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method to display the high score stored in NSUserDefaults.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (void)displayHighScore
{
    // Get the stored high score
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedScore = [defaults integerForKey:NSDEFAULT_KEY_SCORE];
    
    // Format the high score
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    formatter.groupingSize = 3;
    formatter.usesGroupingSeparator = YES;
    formatter.maximumFractionDigits = 0;
    NSString *formattedString = [formatter stringFromNumber:[NSNumber numberWithInteger:savedScore]];
    
    // Display the high score
    self.highScoreDisplay.text = formattedString;
}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method is called when returning from QuestionViewController.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)unwindFromQuestionViewController:(UIStoryboardSegue *)segue
{
    // Update the high score display
    [self displayHighScore];
}
@end
