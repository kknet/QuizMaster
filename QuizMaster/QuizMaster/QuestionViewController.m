//
//  QuestionViewController.m
//  QuizMaster
//
//  Created by Juliana Strawn on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import "QuestionViewController.h"
#define COUNT_DOWNSECONDS 20

@interface QuestionViewController ()

{
    UILabel *progress;
    NSTimer *timer;
    int currSeconds;
}
@end

@implementation QuestionViewController
{
    GameEngine *_gameEngine;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _gameEngine = [[GameEngine alloc] init];
    _gameEngine.delegate = self;
    [_gameEngine loadQuestion];
    
    
    progress=[[UILabel alloc] initWithFrame:CGRectMake(56, 8, 55, 55)];
    progress.textColor=[UIColor whiteColor];
    progress.textAlignment = NSTextAlignmentCenter;
    [progress setFont:[UIFont fontWithName:@"Helvetica" size:25]];
    
    [progress setText:[NSString stringWithFormat: @"0%d",COUNT_DOWNSECONDS]];
    progress.backgroundColor=[UIColor clearColor];
    [self.view addSubview:progress];
    currSeconds=COUNT_DOWNSECONDS;
    
}

-(void) viewWillAppear:(BOOL)animated {
    self.soundON = YES;
    
    // play Jeopardy Think song
    self.soundFilePath = [NSString stringWithFormat:@"%@/JeopardyThinkMusic.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:self.soundFilePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    self.audioPlayer.numberOfLoops = -1;
    [self.audioPlayer play];
    [self startTimer];

}

-(void)startTimer
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}

-(void)timerFired
{
    if(currSeconds == 0) {
        
        //20If the first heart is still visible then ...
        if (NO == self.heart1.hidden)
            // remove it
            self.heart1.hidden = YES;
        
        // Otherwise, if the second heart is still visible then ...
        else if (NO == self.heart2.hidden)
            // remove it
            self.heart2.hidden = YES;
        else
            [self endGame: _currentScore];
        
        //update high score & load new question
        [_gameEngine loadQuestion];
        currSeconds = COUNT_DOWNSECONDS;
        // reset timer
        [self timerFired];
        
        
    }
    else if(currSeconds > 0) {
        currSeconds -= 1;
        [progress setText:[NSString stringWithFormat:@"%02d",currSeconds]];
        
    }
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

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method is called when End Game button is touched.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)endGame:(id)sender
{
    // Save the user's score
    [_gameEngine saveScore];
    
    // If the audio is on then ...
    if (self.soundON)
        // shut it down.
        [self.audioPlayer stop];

    // Unwind back
    [self performSegueWithIdentifier:@"unwindBackToViewController" sender:self];
}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method is called when one of the four answer button is touched.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)answerButtonTouched:(UIButton *)sender
{
    NSString *msg;
    
    // Initialize next step - to load the next question
    void (^nextStep)(UIAlertAction *) = ^(UIAlertAction * action)
                                        {
                                            [_gameEngine loadQuestion];
                                        };

    // If the correct button was pressed then ...
    if ([_gameEngine isAnswerCorrect:sender.tag])
        // Display a success message
        msg = @"Correct!";

    // Otherwise, ...
    else
    {
        // Display a failure message
        msg = @"Incorrect!";
        
        // If the first heart is still visible then ...
        if (NO == self.heart1.hidden)
            // remove it
            self.heart1.hidden = YES;
        
        // Otherwise, if the second heart is still visible then ...
        else if (NO == self.heart2.hidden)
            // remove it
            self.heart2.hidden = YES;
        
        // Otherwise, ...
        else
        {
            // No point in removing the third heart, because the game is over.
            
            // Display an alternate failure message.
            msg = [NSString stringWithFormat:@"Incorrect.\n\n\n Game Over!"];
            
            // Change the next step - to exit this screen
            nextStep = ^(UIAlertAction * action)
                       {
                           // Unwind back
                           [self performSegueWithIdentifier:@"unwindBackToViewController" sender:self];
                       };
            
            // Save the user's score
            [_gameEngine saveScore];
        
            
            // If the audio is on then ...
            if (self.soundON)
                // shut it down.
                [self.audioPlayer stop];
        }
        
    }
    
    // Initialize the controller for displaying the message
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@" "
                message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    // Create an OK button and associate the nextStep block with it
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK"
                style:UIAlertActionStyleDefault  handler:nextStep];
    
    // Add the button to the controller
    [alert addAction:okButton];
    
    // Display the alert controller
    [self presentViewController:alert animated:YES completion:nil];

}

@end
