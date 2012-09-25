//
//  IncomeType.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/26/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Income;

@interface IncomeType : NSManagedObject

@property (nonatomic, retain) NSString * it_name;
@property (nonatomic, retain) NSSet *itToIncome;
@end

@interface IncomeType (CoreDataGeneratedAccessors)

- (void)addItToIncomeObject:(Income *)value;
- (void)removeItToIncomeObject:(Income *)value;
- (void)addItToIncome:(NSSet *)values;
- (void)removeItToIncome:(NSSet *)values;

@end
