//
//  GeneralManagerViewController.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "GeneralManagerViewController.h"

@implementation GeneralManagerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Quan ly thu chi", @"General");
        self.tabBarItem.image = [UIImage imageNamed:@""];
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
//    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
//    backButton.frame = CGRectMake(0,-5,60,30);
//    
//    [backButton addTarget:self action:@selector(backtoPreviousView) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.hidesBackButton =YES;
//    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:backButton];
}

-(void)backtoPreviousView
{
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
