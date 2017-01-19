#import "jServices.h"
#import "AnswerGenerator.h"

@interface jServices ()

@end

@implementation jServices

- (void)GetRandomQuery:(NSInteger *) category {
    NSString *string = [[NSString alloc] initWithFormat:@"http://jservice.io/api/category?id=%@", category];
    NSURL *URL = [NSURL URLWithString:string];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:URL];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    request.HTTPMethod = @"GET";
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                    NSDictionary * childData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.delegate didFinishLoadingJSON:childData];
                    });
                }] resume];
}

@end
