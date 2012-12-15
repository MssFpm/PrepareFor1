//
//  EditViewController.h
//  PrepareFor1
//
//  Created by Maxim on 12/15/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *itemContent;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property NSString *itemValue;
@property int itemIndex;
@property id listController;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil itemIndex: (int) index itemValue: (NSString *) value;

- (IBAction)updateItem:(id)sender;

@end
