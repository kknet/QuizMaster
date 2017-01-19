//
//  QuestionViewController.m
//  QuizMaster
//
//  Created by Juliana Strawn on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@property (strong, nonatomic) GameEngine *gameEngine;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameEngine = [[GameEngine alloc] init];
    self.gameEngine.delegate = self;
    [self.gameEngine loadQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didFinishLoadingQuestion {
    self.currentScore.text = [NSString stringWithFormat:@"$%ld", self.gameEngine.questionValue];
}

@end
