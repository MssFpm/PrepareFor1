//
//  ItemsListViewController.h
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsListViewController : UIViewController {
     NSMutableArray *items;
}
@property (weak, nonatomic) IBOutlet UITableView *itemsList;

//temp
@property (retain) NSMutableArray *items;
@property (retain) NSMutableString *currentName;
@property (assign) BOOL isTagName;

@end
