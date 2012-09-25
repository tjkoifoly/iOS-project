//
//  DataBaseAccess.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/24/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attributes.h"

@interface DataBaseAccess : NSObject


//SAVE
+(BOOL)saveData;

//CREATE DATA
+(BOOL)createWalletWithName: (NSString *)name andBalance:(double)balance andDate: (NSDate *)date andDebt:(double)debt andLoan: (double) loan andPword:(NSString*)pword andImage: (NSString*) image;
+(BOOL)createWalletWithName: (NSString *)name andBalance: (double)balance andDate: (NSDate *)date andPword:(NSString*)pword andImage: (NSString*) image;

+(BOOL)createPlanWithName: (NSString *)name andAmount: (double)amount andStartDate: (NSDate *)startDate andExpectedDate: (NSDate *)expectedDate inWallet: (id)wallet;

+(void) initData;
+(BOOL)createIncomeWithname: (NSString *)name andAmount: (double) amount andDate: (NSDate *)date andNotes:(NSString *)notes inPlan: (id)plan ofType: (id)type;
+(BOOL)createExpenseWithname: (NSString *)name andAmount: (double) amount andDate: (NSDate *)date andNotes:(NSString *)notes inPlan: (id)plan ofType: (id)type;

+(BOOL)createDebtWithName: (NSString *)name andAmount: (double)amount andDate: (NSDate *)date andExpectedDate: (NSDate *)expectedDate andLender: (NSString *)lender andNotes: (NSString *)notes inWallet: (id)wallet;
+(BOOL)createLoanWithName: (NSString *)name andAmount: (double)amount andDate: (NSDate *)date andExpectedDate: (NSDate *)expectedDate andBorrower: (NSString *)borrower andNotes: (NSString *)notes inWallet: (id)wallet;

+(BOOL)createDebtHistory: (double)amount onDate: (NSDate *)date inDebt: (id)debt;
+(BOOL)createLoanHistory: (double)amount onDate: (NSDate *)date inLoan: (id)loan;

//QUERRY DATA
+(NSArray *)getAllWallet;
+(NSArray *)getAllIncomeType;
+(NSArray *)getAllExpenseType;
+(NSArray *)getAllPlanInWallet: (id) wallet;
+(NSArray *)getAllLoanInWallet: (id) wallet;
+(NSArray *)getAllDebtInWallet: (id) wallet;
+(NSArray *)getAllDebtHistoryInDebt: (id)debt;
+(NSArray *)getAllLoanHistoryInLoan: (id)loan;
+(NSArray *)getAllIncomeInIncomeType: (id)incomeType;
+(NSArray *)getAllExpenseInExpenseType: (id)expenseType;
+(NSArray *)getAllIncomeInPlan: (id) plan;
+(NSArray *)getAllExpenseInPlan: (id) plan;

//DELETE OBJECT
+(void)deleteObject: (id)object;
+(void)deleteArrayObject: (NSArray *)listObject;
+(void)deleteLoanHistory:(LoanHistory *)hObject;
+(void)deleteDebtHistory:(DebtHistory *)hObject;
+(void)deleteDebt: (Debt *)dObject;
+(void)deleteLoan: (Loan *)lObject;
+(void)deleteIncome: (Income *)iObject;
+(void)deleteExpense: (Expense *)eObject;
+(void)deletePlan: (Plan *)pObject;
+(void)deleteWallet: (Wallet *) wObject;


@end
