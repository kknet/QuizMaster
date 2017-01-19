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
}

- (IBAction)startGame:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *questionNAnswers = [storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];
    [self presentViewController:questionNAnswers animated:true completion:nil];
}


@end
