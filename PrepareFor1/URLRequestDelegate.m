//
//  URLRequestDelegate.m
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "URLRequestDelegate.h"
#import "XMLParserDelegate.h"

@implementation URLRequestDelegate

- (id) initWithViewController: (id)viewController {
    self = [super init];
    if (self) {
        self.parentViewController = viewController;
    }
    return self;
 
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"RESPONSE --------> %@", response);
}

// Save to file
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
    NSLog(@"CONNECTION ERROR ------->");
    id view = [self.parentViewController view];
    id spinner = [view viewWithTag:1];
    [spinner stopAnimating];
    [spinner removeFromSuperview];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    id viewController = self.parentViewController;
    
    
    id view = [self.parentViewController view];
    id spinner = [view viewWithTag:1];
    [spinner stopAnimating];
     [spinner removeFromSuperview];
    NSLog(@"%@", spinner);
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                   NSUserDomainMask, YES);
    NSMutableString *fullPath = [[NSMutableString alloc] init];
    [fullPath appendString:[dirPaths lastObject]];
    [fullPath appendString:@"/test.xml"];
//    NSLog(fullPath);
    NSData *data = [[NSData alloc] initWithContentsOfFile:fullPath];
    NSXMLParser *addressParser = [[NSXMLParser alloc] initWithData:data];
    XMLParserDelegate *parseDelegate = [[XMLParserDelegate alloc] init];
    
    parseDelegate.viewController = viewController;
    [addressParser setDelegate:parseDelegate];
    [addressParser setShouldResolveExternalEntities:YES];
    [addressParser parse];
}

@synthesize parentViewController;
@end
