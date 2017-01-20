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
    self.category.text = _gameEngine.categoryName;
    self.question.text = _gameEngine.question;
    self.answer1.text = _gameEngine.answerChoice1;
    self.answer2.text = _gameEngine.answerChoice2;
    self.answer3.text = _gameEngine.answerChoice3;
    self.answer4.text = _gameEngine.answerChoice4;
}

- (IBAction)endGame:(id)sender {
}
@end
