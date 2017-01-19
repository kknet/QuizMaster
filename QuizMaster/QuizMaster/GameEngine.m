//
//  GameEngine.m
//  QuizMaster
//
//  Created by bl on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//


// #import <stdlib.h>
#import "GameEngine.h"


const NSInteger MAX_CHOICES = 4;


@implementation GameEngine
{
    NSInteger _categoryId;
    NSInteger _correctAnswer;
    NSInteger _fourRandomIndex[MAX_]
}

// Private constants
NSString *const NSDEFAULT_KEY_SCORE = @"QuizMasterHighScore";

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Initializer for GameEngine
//
//////////////////////////////////////////////////////////////////////////////////////////
-(id)init
{
    if (self = [super init])
    {
        // Get the stored data
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // Get the saved color settings
        self.highScore = [defaults integerForKey:NSDEFAULT_KEY_SCORE];
    }

    return self;
}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method to save current score if it is higher than the previously saved score.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (void) saveScore
{
    if (self.currentScore > self.highScore)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
        [defaults setInteger:self.currentScore forKey:NSDEFAULT_KEY_SCORE];

        [defaults synchronize];
    }
}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method to check if the answer is correct.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (Boolean)isAnswerCorrect:(NSInteger)answer
{
    if (answer == _correctAnswer)
    {
        self.currentScore += self.questionValue;
        return YES;
    }
    else
    {
        self.currentScore -= self.questionValue;
        return NO;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method to randomly pick a question.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (void)loadQuestion
{
    const NSInteger MAX_CATEGORY = 10000;
    const NSInteger MAX_QUESTION = 100;

    NSString *choices[MAX_CHOICES];
    
#if 0
    _categoryId = arc4random() % MAX_CATEGORY;
    _correctAnswer = arc4random() % MAX_CHOICES;

#endif
    
    self.answerChoice1 = choices[0];
    self.answerChoice2 = choices[1];
    self.answerChoice3 = choices[2];
    self.answerChoice4 = choices[3];
}



@end
