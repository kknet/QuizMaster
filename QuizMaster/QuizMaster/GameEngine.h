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

- (void) saveScore;

@end
