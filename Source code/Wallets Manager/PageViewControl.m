//
//  PageControlExampleViewControl.m
//  PageControlExample
//
//  Created by Chakra on 26/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PageViewControl.h"


static NSArray *__pageControlColorList = nil;

@implementation PageViewControl

@synthesize pageNumberLabel;
@synthesize table;
@synthesize eventsList;

// Creates the color list the first time this method is invoked. Returns one color object from the list.
+ (UIColor *)pageControlColorWithIndex:(NSUInteger)index {
    if (__pageControlColorList == nil) {
        __pageControlColorList = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor magentaColor],
                                  [UIColor blueColor], [UIColor orangeColor], [UIColor brownColor], [UIColor grayColor], nil];
    }
    // Mod the index by the list length to ensure access remains in bounds.
    return [__pageControlColorList objectAtIndex:index % [__pageControlColorList count]];
}

// Load the view nib and initialize the pageNumber ivar.
- (id)initWithPageNumber:(int)page {

    self =  (PageViewControl *)[[[NSBundle mainBundle] loadNibNamed:@"PageController" owner:nil options:nil] objectAtIndex:0];
    pageNumber = page;
    [self viewDidLoad];
    
    return self;
}


// Set the label and background color when the view has finished loading.
- (void)viewDidLoad {
    pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", pageNumber + 1];
    self.backgroundColor = [PageViewControl pageControlColorWithIndex:pageNumber];
    self.table.backgroundColor = [PageViewControl pageControlColorWithIndex:pageNumber];
    
    if(eventsList == nil)
        eventsList = [[NSArray alloc] initWithObjects:@"Event 1", @"Event 2", @"Event 3", @"Event 4", @"Event 5",@"Event 5",@"Event 5",@"Event 5",@"Event 6",@"Event 7",@"Event 8",@"Event 9",@"Event 10",@"Event 11",@"Event 12",@"Event 13",@"Event 14",@"Event 15",@"Event 16",@"Event 17",@"Event 18",@"Event 19",@"Event 20",nil];
}


#pragma mark - table view delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [eventsList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *EventIdentifier = @"EventIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EventIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:EventIdentifier];
    }
    
    cell.textLabel.text = [eventsList objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"wallet-02"];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

@end
