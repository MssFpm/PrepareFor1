//
//  ItemsListViewController.m
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import "ItemsListViewController.h"

@interface ItemsListViewController ()

@end

@implementation ItemsListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
        NSArray *dirPaths;
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask, YES);
        NSMutableString *fullPath = [[NSMutableString alloc] init];
        [fullPath appendString:[dirPaths lastObject]];
        [fullPath appendString:@"/test.xml"];
        //    NSLog(fullPath);
        NSData *data = [[NSData alloc] initWithContentsOfFile:fullPath];
        NSXMLParser *addressParser = [[NSXMLParser alloc] initWithData:data];
        [addressParser setDelegate:self];
        [addressParser setShouldResolveExternalEntities:YES];
        self.isTagName = YES;
        [addressParser parse]; // return value not used
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
    
    [cell.textLabel setText:[self.items objectAtIndex:indexPath.item]];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     NSLog(@"--->%i", self.items.count);
    return [self.items count];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    NSLog(elementName);
   
    if ( [elementName isEqualToString:@"name"]) {
        // addresses is an NSMutableArray instance variable
        self.currentName = [[NSMutableString alloc] init];
        self.isTagName = YES;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (self.isTagName) {
        [self.currentName appendString:string]; //passing the value of the current elemtn to the string
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"name"]) {
        self.isTagName = NO;  // disable the flag
        NSLog(@"Name %@", self.currentName); //show current element
        [self.items addObject:self.currentName];//not only is not reading all xml "name" elements but also adding another elements not shown in above NSLog....
        [self.itemsList reloadData];
    }
}

@synthesize currentName;

@end
