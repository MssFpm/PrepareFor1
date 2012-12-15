//
//  AppDelegate.h
//  PrepareFor1
//
//  Created by Maxim on 12/8/12.
//  Copyright (c) 2012 Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property NSMutableArray *items;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
