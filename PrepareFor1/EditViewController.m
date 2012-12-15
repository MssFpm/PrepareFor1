//
//  EditViewController.m
//  PrepareFor1
//
//  Created by Maxim on 12/15/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil itemIndex:(int)index itemValue:(NSString *)value {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    // Custom initialization
        self.itemIndex = index;
        self.itemValue = value;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self itemContent] setText: [self itemValue]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateItem:(id)sender {
    id appDelegate = [[UIApplication sharedApplication] delegate];
    id items = [appDelegate items];
    id tableView = [[self listController] performSelector:  @selector(itemsList)];
    [items removeObjectAtIndex:self.itemIndex];
    [items insertObject:[self.itemContent text] atIndex: self.itemIndex];
     [tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
