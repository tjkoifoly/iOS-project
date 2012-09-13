//
//  GeneralManagerViewController.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/13/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneralManagerViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;

- (IBAction)changePage:(id)sender;

- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;

@end
