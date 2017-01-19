#import <Foundation/Foundation.h>

@class jServices;
@protocol jServicesDelegate <NSObject>

- (void)didFinishLoadingJSON:(NSDictionary *)questionAndAnwers;

@end

@interface jServices: NSObject

@property (strong, nonatomic) id<jServicesDelegate> delegate;

- (void)GetRandomQuery:(NSInteger *) category;

@end
