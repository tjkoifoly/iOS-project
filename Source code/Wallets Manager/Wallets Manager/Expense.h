//
//  Expense.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/25/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Expense : NSManagedObject

@property (nonatomic, retain) NSNumber * e_amount;
@property (nonatomic, retain) NSDate * e_date;
@property (nonatomic, retain) NSString * e_name;
@property (nonatomic, retain) NSString * e_notes;
@property (nonatomic, retain) NSManagedObject *eToExpenseType;
@property (nonatomic, retain) NSManagedObject *eToPlan;

@end
