//
//  MainViewController.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalletsViewController.h"
#import "WalletManagerController.h"

@class WalletsViewController;
@interface MainViewController : UIViewController<WalletsDelegate>

@property (strong, nonatomic) WalletsViewController *walletsViewController;
@property (strong, nonatomic) WalletManagerController *tabBarController;

@end
