//
//  PageControlExampleViewControl.h
//  PageControlExample
//
//  Created by Chakra on 26/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PageViewControl : UIView<UITableViewDelegate, UITableViewDataSource> {

    IBOutlet UITableView *table;
	IBOutlet UILabel *pageNumberLabel;
    int pageNumber;
}

@property (nonatomic, retain) UILabel *pageNumberLabel;
@property (nonatomic, retain) UITableView *table;

@property (strong, nonatomic) NSArray *eventsList;

- (id)initWithPageNumber:(int)page;
- (void)viewDidLoad;

	


@end
