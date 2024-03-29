//
//  MainViewController.h
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *getLIstButton;
@property (weak, nonatomic) IBOutlet UIButton *storeListButton;
@property (weak, nonatomic) IBOutlet UIButton *goToListButton;
@property (weak, nonatomic) IBOutlet UIButton *goToDbListButton;
@property NSMutableArray *items;
- (IBAction)loadListFromServer:(id)sender;
- (IBAction)goToItemsList:(id)sender;
- (IBAction)storeListToDatabase:(id)sender;
- (IBAction)goToDbList:(id)sender;

- (void) hideButtons;
- (void) showButtons;

@end
