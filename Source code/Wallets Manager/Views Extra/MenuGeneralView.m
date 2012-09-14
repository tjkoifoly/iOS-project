//
//  MenuGeneralView.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/15/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "MenuGeneralView.h"

@implementation MenuGeneralView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(IBAction)addEvent:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AddEvent" object:self];
}

-(IBAction)deleteEvent:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DeleteEvent" object:self];
}

@end
