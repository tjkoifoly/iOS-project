//
//  ExpenseType.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/26/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Expense;

@interface ExpenseType : NSManagedObject

@property (nonatomic, retain) NSString * et_name;
@property (nonatomic, retain) NSSet *etToExpense;
@end

@interface ExpenseType (CoreDataGeneratedAccessors)

- (void)addEtToExpenseObject:(Expense *)value;
- (void)removeEtToExpenseObject:(Expense *)value;
- (void)addEtToExpense:(NSSet *)values;
- (void)removeEtToExpense:(NSSet *)values;

@end
