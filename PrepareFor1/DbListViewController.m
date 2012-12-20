//
//  DbListViewController.m
//  PrepareFor1
//
//  Created by Maxim on 12/20/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "DbListViewController.h"
#import "Item.h"

@interface DbListViewController ()

@end

@implementation DbListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadDataFromDb];
    }
    return self;
}

- (void) loadDataFromDb {
    id appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:@"Item"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    self.dbItems = [context executeFetchRequest:request
                                          error:nil];
 
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
    NSString *label = [[self.dbItems objectAtIndex:indexPath.row] title];
    [cell.textLabel setText: label];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [self.dbItems count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UIAlertView *deleteAlert = [[UIAlertView alloc] initWithTitle:@"Delete"                                                           message:@"Remove item from database"
        delegate:self
        cancelButtonTitle:@"NO"
        otherButtonTitles:@"Yes", nil] ;
    [deleteAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    - (NSIndexPath *)indexPathForSelectedRow
    if(buttonIndex == 1) {
        Item* item = [self.dbItems objectAtIndex:[[self.dbLIstTable indexPathForSelectedRow] row]];
        NSLog(@"ITEm - %@", [item title]);
        id appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        [context deleteObject:item];
        [context save:nil];
        [self loadDataFromDb];
        [self.dbLIstTable reloadData];
    }
}



@end
