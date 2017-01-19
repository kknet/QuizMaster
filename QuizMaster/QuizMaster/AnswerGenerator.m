#import "AnswerGenerator.h"

@protocol AnswerGeneratorDelegate <NSObject>

@optional
- (void)didGetJSON;

@end

@interface AnswerGenerator ()

@property (strong, nonatomic) jServices *web;

@end

@implementation AnswerGenerator

-(id)init
{
    if (self = [super init])
    {
        self.web.delegate = self;
    }
    return self;
}

- (void)generationRandomQuestion: (NSInteger *)fromCategory {
    [self.web GetRandomQuery:fromCategory];
}

- (void)didFinishLoadingJSON:(NSMutableDictionary *)questionAndAnwers {
    
}

@end
