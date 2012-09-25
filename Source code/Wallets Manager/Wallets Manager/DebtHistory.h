//
//  DebtHistory.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/25/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Debt;

@interface DebtHistory : NSManagedObject

@property (nonatomic, retain) NSNumber * dh_amount;
@property (nonatomic, retain) NSDate * dh_date;
@property (nonatomic, retain) Debt *dhToDebt;

@end
