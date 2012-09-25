//
//  Loan.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/25/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Loan : NSManagedObject

@property (nonatomic, retain) NSNumber * l_amount;
@property (nonatomic, retain) NSString * l_borrower;
@property (nonatomic, retain) NSDate * l_date;
@property (nonatomic, retain) NSDate * l_expected_date;
@property (nonatomic, retain) NSNumber * l_finished;
@property (nonatomic, retain) NSString * l_name;
@property (nonatomic, retain) NSString * l_notes;
@property (nonatomic, retain) NSSet *lToLoanHistory;
@property (nonatomic, retain) NSManagedObject *lToWallet;
@end

@interface Loan (CoreDataGeneratedAccessors)

- (void)addLToLoanHistoryObject:(NSManagedObject *)value;
- (void)removeLToLoanHistoryObject:(NSManagedObject *)value;
- (void)addLToLoanHistory:(NSSet *)values;
- (void)removeLToLoanHistory:(NSSet *)values;

@end
