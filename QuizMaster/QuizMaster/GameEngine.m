//
//  GameEngine.m
//  QuizMaster
//
//  Created by bl on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//


#import <stdlib.h>
#import "GameEngine.h"


const NSInteger MAX_CHOICES = 4;
const NSInteger MAX_QUESTIONS = 100;


@implementation GameEngine
{
    NSInteger _correctAnswer;
    AnswerGenerator *_ag;
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
#if 0
        // Get the stored data
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // Get the saved color settings
        self.highScore = [defaults integerForKey:NSDEFAULT_KEY_SCORE];
#endif
        
        _ag.delegate = self;
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
    const NSInteger MAX_CATEGORIES = 10000;

    // Randomly generate category id
    NSInteger categoryId = arc4random_uniform(MAX_CATEGORIES);
    
    // Request a batch of questions for the category
    [_ag GetRandomQuery:categoryId];
}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method called when jService API finishes.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (void)didFinishLoadingJSON:(NSDictionary *)questionAndAnwers
{
    NSString *choices[MAX_CHOICES];
    
    // Generate a random location for the correct answer
    _correctAnswer = arc4random_uniform(MAX_CHOICES);
    
    //
    self.categoryName = questionAndAnwers[@"title"];
    NSArray *questions = questionAndAnwers[@"clues"];
    NSDictionary *clue;

    // Generate numbers to select 4 random questions
    NSInteger questionCount = [questions count];
    NSInteger *indexes = [self get4UniqueNumber:questionCount];

    clue = questions[indexes[0]];
    self.question = clue[@"question"];
    self.questionValue = clue[@"value"];
    choices[_correctAnswer] = clue[@"answer"];

    NSInteger currentIndex = 1;
    
    for (int i = 0; i < MAX_CHOICES; ++i)
    {
        if (i == _correctAnswer)
            continue;
        
        clue = questions[indexes[currentIndex++]];
        choices[i] = clue[@"answer"];
    }

    self.answerChoice1 = choices[0];
    self.answerChoice2 = choices[1];
    self.answerChoice3 = choices[2];
    self.answerChoice4 = choices[3];
    
    [self.delegate didFinishLoadingQuestion];
}

//////////////////////////////////////////////////////////////////////////////////////////
//
//  Method to return 4 unique random numbers for question selection.
//
//////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger *)get4UniqueNumber:(NSInteger)maxNumber
{
    Boolean duplicate[MAX_QUESTIONS];
    static NSInteger uniqueNumbers[MAX_CHOICES];
    NSInteger temp;
    
    for (int i = 0; i < MAX_CHOICES; ++i)
    {
        do
        {
            // Generate random number
            temp = arc4random_uniform(maxNumber);
        }
        while (duplicate[temp]);
        
        duplicate[temp] = YES;
        uniqueNumbers[i] = temp;
    }
    
    return uniqueNumbers;
}

@end
