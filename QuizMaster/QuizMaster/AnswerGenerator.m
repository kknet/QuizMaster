#import "AnswerGenerator.h"
#import "jServices.h"

@protocol AnswerGeneratorDelegate <NSObject>

@optional
- (void)didGetJSON;

@end

@interface AnswerGenerator ()

@property (weak, nonatomic) jServices *web;
@property(strong, nonatomic) id <AnswerGeneratorDelegate> delegate;

@end

@implementation AnswerGenerator



@end
