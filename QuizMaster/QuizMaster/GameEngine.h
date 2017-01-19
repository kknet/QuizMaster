//
//  GameEngine.h
//  QuizMaster
//
//  Created by bl on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameEngine : NSObject

@property (nonatomic) NSInteger currentScore;
@property (nonatomic) NSInteger highScore;

@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *answerChoice1;
@property (nonatomic, strong) NSString *answerChoice2;
@property (nonatomic, strong) NSString *answerChoice3;
@property (nonatomic, strong) NSString *answerChoice4;
@property (nonatomic) NSInteger questionValue;

- (void) loadQuestion;
- (void) isAnswerCorrect:(NSInteger)answer;
- (void) saveScore;

@end
