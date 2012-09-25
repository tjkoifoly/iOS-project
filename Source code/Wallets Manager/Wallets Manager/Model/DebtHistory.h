//
//  DebtHistory.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/26/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DebtHistory : NSManagedObject

@property (nonatomic, retain) NSNumber * dh_amount;
@property (nonatomic, retain) NSDate * dh_date;
@property (nonatomic, retain) NSManagedObject *dhToDebt;

@end
