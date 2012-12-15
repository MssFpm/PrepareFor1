//
//  XMLParserDelegate.h
//  PrepareFor1
//
//  Created by Maxim on 12/10/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParserDelegate : NSObject

@property (retain) NSMutableString *currentName;
@property (assign) BOOL isTagName;
@property (retain) id viewController;


@end
