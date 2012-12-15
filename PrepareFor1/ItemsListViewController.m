//
//  ItemsListViewController.m
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "ItemsListViewController.h"
#import "XMLParserDelegate.h"
#import "EditViewController.h"

@interface ItemsListViewController ()

@end

@implementation ItemsListViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    id appDelegate = [[UIApplication sharedApplication] delegate];
    id items = [appDelegate items];
    [cell.textLabel setText:[items objectAtIndex:indexPath.item]];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id appDelegate = [[UIApplication sharedApplication] delegate];
    id items = [appDelegate items];
     NSLog(@"--->%i", [items count]);
    return [items count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id appDelegate = [[UIApplication sharedApplication] delegate];
    id items = [appDelegate items];
    EditViewController *editController = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil itemIndex:indexPath.row itemValue:[items objectAtIndex:indexPath.row]];
    editController.listController = self;
    [[self navigationController] pushViewController:editController animated:YES];
 }


@synthesize currentName;

@end
