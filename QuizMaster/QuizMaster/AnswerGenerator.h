#import <Foundation/Foundation.h>
#import "jServices.h"

@interface AnswerGenerator: NSObject <jServicesDelegate>

- (void)generationRandomQuestion: (NSInteger *)fromCategory;

@end
