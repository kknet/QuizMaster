//
//  QuestionViewController.h
//  QuizMaster
//
//  Created by Juliana Strawn on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentScore;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *answer1;
@property (weak, nonatomic) IBOutlet UILabel *answer2;
@property (weak, nonatomic) IBOutlet UILabel *answer3;
@property (weak, nonatomic) IBOutlet UILabel *answer4;
@property (weak, nonatomic) IBOutlet UIView *endGame;

@end