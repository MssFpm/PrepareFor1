//
//  URLRequestDelegate.m
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "URLRequestDelegate.h"

@implementation URLRequestDelegate

- (id) initWithViewController: (id)viewController {
    self = [super init];
    if (self) {
        self.parentViewController = viewController;
    }
    return self;
 
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"rec %@", response);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                   NSUserDomainMask, YES);
    NSMutableString *fullPath = [[NSMutableString alloc] init];
    [fullPath appendString:[dirPaths lastObject]];
    [fullPath appendString:@"/test.xml"];
//    NSLog(fullPath);
    [data writeToFile:fullPath atomically:YES];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"finish Loading");

    id viewController = self.parentViewController;
    id button = [viewController performSelector:@selector(storeListButton)];
    NSLog(@"here");
    [button setEnabled:TRUE];
    button = [viewController performSelector:@selector(goToListButton)];
    [button setEnabled:TRUE];
}

@synthesize parentViewController;
@end
