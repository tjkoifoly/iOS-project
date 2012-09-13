//
//  MainViewController.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "MainViewController.h"
#import "WalletsViewController.h"
#import "GeneralManagerViewController.h"
#import "ReportViewController.h"
#import "PlanViewController.h"

@implementation MainViewController

@synthesize walletsViewController;
@synthesize tabBarController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(walletsViewController == nil)
    {
        walletsViewController = [[WalletsViewController alloc] initWithNibName:@"WalletsViewController" bundle:nil];
         walletsViewController.delegate = self;
    }
    [self performSelector:@selector(loadWallets:) withObject:walletsViewController afterDelay:2];
}

-(void)loadWallets: (UIViewController *)controller
{
    [self.view addSubview:controller.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    walletsViewController   = nil;
    tabBarController        = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - WalletDelegate

-(void)walletDidSelected:(id)wallet
{
    NSLog(@"%@", wallet);
    if(tabBarController == nil)
    {
        tabBarController = [[WalletManagerController alloc] init];
        [tabBarController initWithComponents];
    }
    //[walletsViewController.view removeFromSuperview];
    
    [self.view addSubview:tabBarController.view];
}

@end
