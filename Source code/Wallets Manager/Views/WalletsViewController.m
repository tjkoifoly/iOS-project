//
//  WalletsViewController.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "WalletsViewController.h"

@implementation WalletsViewController

@synthesize table;
@synthesize walletsList;
@synthesize delegate;
@synthesize btnEdit;

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
    
    walletsList = [[NSMutableArray alloc] init];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"Vi 1", @"name",@"10000$", @"money", nil];
    [self.walletsList addObject:dict];
    NSDictionary *dict2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Vi 2", @"name",@"10000$", @"money", nil];
    [self.walletsList addObject:dict2];
    NSDictionary *dict3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Vi 3", @"name",@"10000$", @"money", nil];
    [self.walletsList addObject:dict3];
    NSDictionary *dict4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Vi 4", @"name",@"10000$", @"money", nil];
    [self.walletsList addObject:dict4];
    NSDictionary *dict5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Vi 5", @"name",@"10000$", @"money", nil];
    [self.walletsList addObject:dict5];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    table           = nil;
    walletsList     = nil;
    delegate        = nil;
    btnEdit         = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - TableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [walletsList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *WalletIdentifier = @"WalletIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WalletIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:WalletIdentifier];
        cell.imageView.image = [UIImage imageNamed:@"wallet-01"];
        if(indexPath.row % 5 == 0)
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock-open-02.png"]];
        else
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock-05"]];
        cell.textLabel.text = [[walletsList objectAtIndex:indexPath.row] valueForKey:@"name"];;
        cell.detailTextLabel.text = [[walletsList objectAtIndex:indexPath.row] valueForKey:@"money"];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate walletDidSelected:[walletsList objectAtIndex:indexPath.row]];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [walletsList removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - IBAction
-(IBAction)editChange:(id)sender
{
    
}

-(IBAction)addWallet:(id)sender
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"Vi 1", @"name",@"10000", @"money", nil];
    
    [self.walletsList addObject:dict];
    
    NSLog(@"ADD");
    
    [table reloadData];
}


@end
