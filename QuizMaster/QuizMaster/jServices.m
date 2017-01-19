#import "jServices.h"
#import "AnswerGenerator.h"

@interface jServices ()

@property (weak, nonatomic) AnswerGenerator *AnswerGenerator;
//@property (strong, nonatomic) AnswerGeneratorDelegate *delegate;

@end

@implementation jServices

- (void)GetRandomQuery {
    NSURL *URL = [NSURL URLWithString:@"http://jservice.io/api/random?count=100"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:URL];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    request.HTTPMethod = @"GET";
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                    NSDictionary * childData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //TODO:
                    });
                }] resume];
}

@end
