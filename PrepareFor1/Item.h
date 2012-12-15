//
//  Item.h
//  PrepareFor1
//
//  Created by Maxim on 12/10/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * rate;

@end
