#import <Foundation/Foundation.h>

@class AnswerGenerator;
@protocol AnswerGeneratorDelegate <NSObject>

- (void)didFinishLoadingJSON:(NSDictionary *)questionAndAnwers;

@end

@interface AnswerGenerator: NSObject

@property (strong, nonatomic) id<AnswerGeneratorDelegate> delegate;
- (void)GetRandomQuery:(NSInteger) category;

@end
