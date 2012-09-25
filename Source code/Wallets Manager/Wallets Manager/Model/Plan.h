//
//  Plan.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/26/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Expense, Income, Wallet;

@interface Plan : NSManagedObject

@property (nonatomic, retain) NSString * p_name;
@property (nonatomic, retain) NSNumber * p_amount;
@property (nonatomic, retain) NSNumber * p_cancel;
@property (nonatomic, retain) NSNumber * p_completed;
@property (nonatomic, retain) NSDate * p_expected_date;
@property (nonatomic, retain) NSDate * p_real_completed_date;
@property (nonatomic, retain) NSDate * p_start_date;
@property (nonatomic, retain) NSSet *pToExpense;
@property (nonatomic, retain) NSSet *pToIncome;
@property (nonatomic, retain) Wallet *pToWallet;
@end

@interface Plan (CoreDataGeneratedAccessors)

- (void)addPToExpenseObject:(Expense *)value;
- (void)removePToExpenseObject:(Expense *)value;
- (void)addPToExpense:(NSSet *)values;
- (void)removePToExpense:(NSSet *)values;

- (void)addPToIncomeObject:(Income *)value;
- (void)removePToIncomeObject:(Income *)value;
- (void)addPToIncome:(NSSet *)values;
- (void)removePToIncome:(NSSet *)values;

@end
