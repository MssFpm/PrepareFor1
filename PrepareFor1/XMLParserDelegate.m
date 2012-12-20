//
//  XMLParserDelegate.m
//  PrepareFor1
//
//  Created by Maxim on 12/10/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "XMLParserDelegate.h"

@implementation XMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
//    NSLog(elementName);
    
    if ( [elementName isEqualToString:@"name"]) {
        // addresses is an NSMutableArray instance variable
        self.currentName = [[NSMutableString alloc] init];
        self.isTagName = YES;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (self.isTagName) {
        [self.currentName appendString:string]; //passing the value of the current elemtn to the string
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"name"]) {
        id appDelegate = [[UIApplication sharedApplication] delegate];
        self.isTagName = NO;  // disable the flag
        id tempItems = [appDelegate items];
        [tempItems addObject:self.currentName];
        NSLog(@"Name %@", self.currentName); //show current element
//        id  tableView = [[self viewController] performSelector:@selector(itemsList)];
//        [tableView reloadData];
    }
}

- (void) parserDidEndDocument: (NSXMLParser *)parser {
    [self.viewController performSelector:@selector(showButtons)];
}

- (void) parserDidStartDocument: (NSXMLParser *)parser {
    
}

@end
