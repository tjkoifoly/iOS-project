//
//  WalletsViewController.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "WalletsViewController.h"

#define kRowHeight 50

@implementation WalletsViewController



@synthesize table;
@synthesize walletsList;
@synthesize delegate;
@synthesize popupView;
@synthesize editButton;
@synthesize deleteButton;
@synthesize testView;
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
    [self setPopupView:nil];
    [self setEditButton:nil];
    [self setDeleteButton:nil];
    [self setTestView:nil];
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

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kRowHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *WalletIdentifier = @"WalletIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WalletIdentifier];
    
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress :)];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:WalletIdentifier];
        
        [cell addGestureRecognizer:longTap];
        
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

- (IBAction)editButtonClicked:(id)sender {
    NSLog(@"edit");
}

- (IBAction)deleteButtonClicked:(id)sender {
    NSLog(@"delete");
}

#pragma mark - UIGesture Delegate

-(void) handleLongPress: (UIGestureRecognizer *)longPress {
    
    CGPoint p = [longPress locationInView:self.table];
    
    NSIndexPath *indexPath = [self.table indexPathForRowAtPoint:p];
    if (indexPath == nil)
        NSLog(@"long press on table view but not on a row");
    else
        NSLog(@"long press on table view at row %d", indexPath.row);
    
    CGRect currentRowFrame = CGRectMake(0, 0, 320, kRowHeight);
    currentRowFrame.origin.y = kRowHeight * indexPath.row +40;
    
    
    if (popup == nil) {
		if (currentMessageIndex == 0) {
            // testContentView.frame = CGRectMake(100, 20, 200, 100);
			popup = [[SNPopupView alloc] initWithContentView:testView contentSize:CGSizeMake(150, 54)];
			//currentMessageIndex++;
		}
		else if (currentMessageIndex == 1) {
			popup = [[SNPopupView alloc] initWithString:@"test message" withFontOfSize:29];
			currentMessageIndex++;
		}
		else if (currentMessageIndex == 2) {
			popup = [[SNPopupView alloc] initWithImage:[UIImage imageNamed:@"2tchSmall.png"]];
			currentMessageIndex = 0;
		}
		if (YES)
			[popup presentModalFromButtonItem:nil inView:self.view frame:currentRowFrame animated:YES];
        //		else
        //			[popup showFromBarButtonItem:sender inView:self.view animated:animationSwitch.on];
        
		[popup addTarget:self action:@selector(didTouchPopupView:)];
		[popup setDelegate:self];
	}
	else if (YES) {
		//[popup dismiss:YES];
		popup = nil;
	}
}

#pragma mark - PopUp Delegate

- (void)didTouchPopupView:(SNPopupView*)sender {
//	DNSLogMethod
//	DNSLog(@"%@", sender);
}



- (void)didDismissModal:(SNPopupView*)popupview {
	//DNSLogMethod
	if (popupview == popup) {
		popup = nil;
	}
}
@end
