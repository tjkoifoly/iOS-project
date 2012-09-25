//
//  Debt.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/26/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DebtHistory, Wallet;

@interface Debt : NSManagedObject

@property (nonatomic, retain) NSString * d_name;
@property (nonatomic, retain) NSNumber * d_amount;
@property (nonatomic, retain) NSDate * d_date;
@property (nonatomic, retain) NSDate * d_expected_date;
@property (nonatomic, retain) NSNumber * d_finished;
@property (nonatomic, retain) NSString * d_lender;
@property (nonatomic, retain) NSString * d_notes;
@property (nonatomic, retain) Wallet *dToWallet;
@property (nonatomic, retain) NSSet *dToDebtHistory;
@end

@interface Debt (CoreDataGeneratedAccessors)

- (void)addDToDebtHistoryObject:(DebtHistory *)value;
- (void)removeDToDebtHistoryObject:(DebtHistory *)value;
- (void)addDToDebtHistory:(NSSet *)values;
- (void)removeDToDebtHistory:(NSSet *)values;

@end
