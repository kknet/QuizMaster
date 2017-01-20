//
//  ViewController.h
//  QuizMaster
//
//  Created by Alique Williams on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameEngine.h"
#import "QuestionViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *highScoreDisplay;
@property (weak, nonatomic) IBOutlet QuestionViewController *questionViewController;

@property (strong) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSString *soundFilePath;

@end

