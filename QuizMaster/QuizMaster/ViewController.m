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
    
    // Get the stored high score
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedScore = [defaults integerForKey:NSDEFAULT_KEY_SCORE];
    
    // Format the high score
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    [formatter setGroupingSeparator:groupingSeparator];
    [formatter setGroupingSize:3];
    [formatter setUsesGroupingSeparator:YES];
    [formatter setMaximumFractionDigits:0];
    NSString *formattedString = [formatter stringFromNumber:[NSNumber numberWithInteger:savedScore]];
                                 
    // Display the high score
    self.highScoreDisplay.text = formattedString;
}

- (IBAction)startGame:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *questionNAnswers = [storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];
    [self presentViewController:questionNAnswers animated:true completion:nil];
}


@end
