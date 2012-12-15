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
#import "Item.h"

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
    [[self storeListButton] setHidden:TRUE];
    [[self goToListButton] setHidden:TRUE];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadListFromServer:(id)sender {
    self.items = [[NSMutableArray alloc] init];
    
    NSString *url = @"http://secure-citadel-8722.herokuapp.com/api/items";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.tag = 1;
    URLRequestDelegate *requestDelegate = [[URLRequestDelegate alloc] initWithViewController: self];
    [[self view] addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    [spinner setCenter:CGPointMake(160.0f, 208.0f)];
    [spinner startAnimating];
    [[NSURLConnection alloc] initWithRequest:request delegate:requestDelegate];
}

- (IBAction)goToItemsList:(id)sender {
    ItemsListViewController *itemsListViewController = [[ItemsListViewController alloc] initWithNibName:@"ItemsListViewController" bundle:nil];
    [self.navigationController pushViewController:itemsListViewController animated:YES];
}

- (IBAction)storeListToDatabase:(id)sender {
    NSLog(@"HERE1");
    id appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    id items = [appDelegate items];
    [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", obj);
        Item *tempItem = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Item"
                         inManagedObjectContext:context];
        [tempItem setTitle:obj];
        [tempItem setRate:@1];
        NSError *error;
        
        [context save:nil];

    }];
    
//    Item *tempItem = [NSEntityDescription
//                                    insertNewObjectForEntityForName:@"Item"
//                                    inManagedObjectContext:context];
//    NSError *error;
    //    [firstObject setValue:@12 forKey:@"age"];
    //    [firstObject setValue:@32 forKey:@"speed"];
    //    [secondObject setValue:@1 forKey:@"age"];
    //    [secondObject setValue:@3 forKey:@"speed"];
    //
//    [context save:nil];
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity:entityDescription];
//    NSArray *objects = [context executeFetchRequest:request error:&error];
//    for(int i = 0; i < objects.count; i++) {
//        NSLog(@"ARRAY ---->%@", [[objects objectAtIndex:i] valueForKey:@"age"]);
//    }

}
@end
