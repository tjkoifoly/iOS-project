//
//  Wallet.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/26/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Debt, Loan, Plan;

@interface Wallet : NSManagedObject

@property (nonatomic, retain) NSString * w_name;
@property (nonatomic, retain) NSNumber * w_balance;
@property (nonatomic, retain) NSDate * w_date;
@property (nonatomic, retain) NSString * w_pword;
@property (nonatomic, retain) NSString * w_image;
@property (nonatomic, retain) NSNumber * w_debt;
@property (nonatomic, retain) NSNumber * w_loan;
@property (nonatomic, retain) NSSet *wToPlan;
@property (nonatomic, retain) NSSet *wToDebt;
@property (nonatomic, retain) NSSet *wToLoan;
@end

@interface Wallet (CoreDataGeneratedAccessors)

- (void)addWToPlanObject:(Plan *)value;
- (void)removeWToPlanObject:(Plan *)value;
- (void)addWToPlan:(NSSet *)values;
- (void)removeWToPlan:(NSSet *)values;

- (void)addWToDebtObject:(Debt *)value;
- (void)removeWToDebtObject:(Debt *)value;
- (void)addWToDebt:(NSSet *)values;
- (void)removeWToDebt:(NSSet *)values;

- (void)addWToLoanObject:(Loan *)value;
- (void)removeWToLoanObject:(Loan *)value;
- (void)addWToLoan:(NSSet *)values;
- (void)removeWToLoan:(NSSet *)values;

@end
