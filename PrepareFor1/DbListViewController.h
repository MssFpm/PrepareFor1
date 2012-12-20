//
//  DbListViewController.h
//  PrepareFor1
//
//  Created by Maxim on 12/20/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DbListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *dbLIstTable;
@property (retain) NSArray *dbItems;

- (void) loadDataFromDb;
@end
