//
//  folyAppDelegate.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/11/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@interface folyAppDelegate : UIResponder <UIApplicationDelegate>

//IB properties
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *rootViewController;



@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
