//
//  GameEngine.m
//  QuizMaster
//
//  Created by bl on 1/19/17.
//  Copyright © 2017 Alique Williams. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

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

@end
