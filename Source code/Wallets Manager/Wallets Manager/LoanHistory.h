//
//  LoanHistory.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/25/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Loan;

@interface LoanHistory : NSManagedObject

@property (nonatomic, retain) NSNumber * lh_amount;
@property (nonatomic, retain) NSDate * lh_date;
@property (nonatomic, retain) Loan *lhToLoan;

@end
