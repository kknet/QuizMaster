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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didFinishLoadingQuestion {
    self.currentScore.text = [NSString stringWithFormat:@"$%ld", (long)_gameEngine.questionValue];
}

- (IBAction)endGame:(id)sender {
}
@end
