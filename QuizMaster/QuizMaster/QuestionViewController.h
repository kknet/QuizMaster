//
//  QuestionViewController.h
//  QuizMaster
//
//  Created by Juliana Strawn on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameEngine.h"
#import <AVFoundation/AVFoundation.h>

@interface QuestionViewController : UIViewController <GameEngineDelegate>

@property (strong) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSString *soundFilePath;
@property BOOL soundON;

@property (weak, nonatomic) IBOutlet UIButton *audioButtonTapped;

@property (weak, nonatomic) IBOutlet UILabel *currentScore;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *question;

- (IBAction)answer1:(id)sender;
- (IBAction)answer2:(id)sender;
- (IBAction)answer3:(id)sender;
- (IBAction)answer4:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *heart1;
@property (weak, nonatomic) IBOutlet UIImageView *heart2;
@property (weak, nonatomic) IBOutlet UIImageView *heart3;
@property (weak, nonatomic) IBOutlet UILabel *questionValueLabel;

- (IBAction)endGame:(id)sender;

@end
