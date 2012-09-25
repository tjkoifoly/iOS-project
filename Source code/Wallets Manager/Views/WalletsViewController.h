//
//  WalletsViewController.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNPopupView.h"
#import "SNPopupView+UsingPrivateMethod.h"

@class WalletsViewController;
@protocol WalletsDelegate <NSObject>

-(void)walletDidSelected:(id)wallet;

@end

@interface WalletsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource , SNPopupViewModalDelegate>
{
    int currentMessageIndex;
    SNPopupView		*popup;
}

@property (strong, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnEdit;

@property (strong, nonatomic) NSMutableArray *walletsList;
@property (strong, nonatomic) id <WalletsDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *popupView;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) IBOutlet UIView *testView;

-(IBAction)editChange:(id)sender;
-(IBAction)addWallet:(id)sender;
- (void)didDismissModal:(SNPopupView*)popupview;
- (void)didTouchPopupView:(SNPopupView*)sender;
- (IBAction)editButtonClicked:(id)sender;
- (IBAction)deleteButtonClicked:(id)sender;


@end
