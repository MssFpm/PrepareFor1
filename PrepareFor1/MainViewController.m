//
//  MainViewController.m
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "MainViewController.h"
#import "URLRequestDelegate.h"
#import "ItemsListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self storeListButton] setEnabled:FALSE];
    [[self goToListButton] setEnabled:FALSE];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadListFromServer:(id)sender {
    NSString *url = @"http://secure-citadel-8722.herokuapp.com/api/items";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    URLRequestDelegate *requestDelegate = [[URLRequestDelegate alloc] initWithViewController: self];
    [[NSURLConnection alloc] initWithRequest:request delegate:requestDelegate];
}

- (IBAction)goToItemsList:(id)sender {
    ItemsListViewController *itemsListViewController = [[ItemsListViewController alloc] initWithNibName:@"ItemsListViewController" bundle:nil];
    [self.navigationController pushViewController:itemsListViewController animated:YES];
}
@end
