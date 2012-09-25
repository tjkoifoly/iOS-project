//
//  LoanHistory.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/26/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LoanHistory : NSManagedObject

@property (nonatomic, retain) NSNumber * lh_amount;
@property (nonatomic, retain) NSDate * lh_date;
@property (nonatomic, retain) NSManagedObject *lhToLoan;

@end
