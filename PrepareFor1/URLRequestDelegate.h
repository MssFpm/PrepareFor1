//
//  URLRequestDelegate.h
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLRequestDelegate : NSObject {
    id parentViewController;
}

- (id) initWithViewController: (id)viewController;

@property (retain) id parentViewController;

@end
