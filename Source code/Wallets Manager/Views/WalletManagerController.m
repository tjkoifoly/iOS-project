//
//  WalletManagerController.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "WalletManagerController.h"
#import "GeneralManagerViewController.h"
#import "ReportViewController.h"
#import "PlanViewController.h"
#import "ToolsViewController.h"
#import "SettingsViewController.h"

@implementation WalletManagerController

-(void) initWithComponents
{
    [self.view setFrame:CGRectMake(0, -20, 320, 480)];
    
    //ADD BACK BUTTON
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"wallet-05"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(5,25,32,32);
    
    [backButton addTarget:self action:@selector(backtoPreviousView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
    
    GeneralManagerViewController *gmvc = [[GeneralManagerViewController alloc] initWithNibName:@"GeneralManagerViewController" bundle:nil];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:gmvc];
    
    ReportViewController *rvc = [[ReportViewController alloc] initWithNibName:@"ReportViewController" bundle:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:rvc];
    
    PlanViewController *pvc = [[PlanViewController alloc] initWithNibName:@"PlanViewController" bundle:nil];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:pvc];
    
    ToolsViewController *tvc = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:tvc];
    
    SettingsViewController *svc = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:svc];
    
    self.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nav3,nav4, nav5, nil];
}

-(void)backtoPreviousView
{
    [self.view removeFromSuperview];
}

@end
