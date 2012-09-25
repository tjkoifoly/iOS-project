//
//  Income.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/25/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Income : NSManagedObject

@property (nonatomic, retain) NSNumber * i_amount;
@property (nonatomic, retain) NSDate * i_date;
@property (nonatomic, retain) NSString * i_name;
@property (nonatomic, retain) NSString * i_notes;
@property (nonatomic, retain) NSManagedObject *iToIncomeType;
@property (nonatomic, retain) NSManagedObject *iToPlan;

@end
