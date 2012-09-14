//
//  GeneralManagerViewController.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "GeneralManagerViewController.h"
#import "AddExpenseViewController.h"
#import "PageViewControl.h"
#import "MenuGeneralView.h"
#import "TapkuLibrary.h"

static NSUInteger kNumberOfPages = 7;

@implementation GeneralManagerViewController
{
    BOOL pageControlUsed;
    BOOL showCalendar;
    BOOL showMenu;
    AddExpenseViewController *adv;
    MenuGeneralView *mgv;
    
}

@synthesize scrollView;
@synthesize pageControl;
@synthesize viewControllers;
@synthesize monthView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Quản lý thu chi", @"General");
        self.tabBarItem.image = [UIImage imageNamed:@"money-01.png"];
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
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0,-5,32,32);
    
    [backButton addTarget:self action:@selector(showMenuView) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.hidesBackButton =YES;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
	
    // a page is the width of the scroll view
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
	
    pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
	
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    showCalendar = NO;
    showMenu     = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addExpense) name:@"AddEvent" object:mgv];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteEvent) name:@"DeleteEvent" object:mgv];
}

-(void)showMenuView
{
    showMenu = !showMenu;
    NSLog(@"Show Menu");
     if(mgv == nil) 
     {
         mgv = (MenuGeneralView *)[[[NSBundle mainBundle] loadNibNamed:@"MenuGeneralView" owner:nil options:nil] objectAtIndex:0];
         CGRect frame = [mgv frame];
         frame.origin.x = 320;
         frame.origin.y = 0;
         [mgv setFrame:frame];
         [self.view addSubview:mgv];
     }
    
    if(showMenu)
        [self viewMoveIn:mgv];
    else
        [self viewMoveOut:mgv];
    
}

-(void)viewMoveIn:(UIView *)subview
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGRect frame = [subview frame];
    frame.origin.x -= frame.size.width;
    
    [subview setFrame:frame];
    
    [UIView commitAnimations];

}

-(void)viewMoveOut:(UIView *)subview
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGRect frame = [subview frame];
    frame.origin.x += frame.size.width;
    
    [subview setFrame:frame];
    //[subview removeFromSuperview];
    [UIView commitAnimations];
}

-(void)addExpense
{
    [self showMenuView];
    
    if(adv == nil)
        adv = [[AddExpenseViewController alloc] initWithNibName:@"AddExpenseViewController" bundle:nil];
    
    NSLog(@"SHOW = %@", adv);
    
    [self presentModalViewController:adv animated:YES];
}

-(void)deleteEvent
{
    [self showMenuView];
    NSLog(@"DELETE");
}

-(void)showCalendar
{
     NSLog(@"Show Calendar");
    showCalendar = !showCalendar;
    if(monthView == nil)
    {
        monthView = [[TKCalendarMonthView alloc] initWithSundayAsFirst:NO];
        monthView.delegate  = self;
        monthView.dataSource = self;
        monthView.center = self.view.center;
    }
    
    if(showCalendar)
    {
        [self.view addSubview:monthView];
        [monthView reload];
    }else
    {
        [monthView removeFromSuperview];
    }

}

- (NSArray*) calendarMonthView:(TKCalendarMonthView*)monthView marksFromDate:(NSDate*)startDate toDate:(NSDate*)lastDate{
	return nil;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    scrollView          = nil;
    pageControl         = nil;
    viewControllers     = nil;
    monthView           = nil;
    adv                 = nil;
    mgv                 = nil;
}

-(void)dealloc
{
    [mgv removeFromSuperview];
    mgv = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma private method
- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= kNumberOfPages) return;
	
    // replace the placeholder if necessary
    PageViewControl *controller = [viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[PageViewControl alloc] initWithPageNumber:page];
        [viewControllers replaceObjectAtIndex:page withObject:controller];
    }
	
    // add the controller's view to the scroll view
    if (nil == controller.superview) {
        CGRect frame = scrollView.frame;
        //NSLog(@"%f - %f", frame.size.width, frame.size.height);
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.frame = frame;
        [scrollView addSubview:controller];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender {
    int page = pageControl.currentPage;
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    // update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

#pragma mark - Calendar Delegate

-(void)calendarMonthView:(TKCalendarMonthView *)monthView didSelectDate:(NSDate *)date
{
    NSLog(@"%@", date);
    [self performSelector:@selector(showCalendar)];
}


@end
