//
//  WalletsViewController.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WalletsViewController;
@protocol WalletsDelegate <NSObject>

-(void)walletDidSelected:(id)wallet;

@end

@interface WalletsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnEdit;

@property (strong, nonatomic) NSMutableArray *walletsList;
@property (strong, nonatomic) id <WalletsDelegate> delegate;

-(IBAction)editChange:(id)sender;
-(IBAction)addWallet:(id)sender;

@end
