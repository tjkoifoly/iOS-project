//
//  DataBaseAccess.m
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/24/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "DataBaseAccess.h"
#import "folyAppDelegate.h"
#import "Attributes.h"

@implementation DataBaseAccess

+(BOOL)saveData
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    return [context save:&error];
}

+(BOOL)createWalletWithName: (NSString *)name andBalance:(double)balance andDate: (NSDate *)date andDebt:(double)debt andLoan: (double) loan andPword:(NSString*)pword andImage: (NSString*) image
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    
    
    Wallet *newWallet = [NSEntityDescription insertNewObjectForEntityForName:kWallet inManagedObjectContext:context];
    
    newWallet.w_name = name;
    newWallet.w_balance = [NSNumber numberWithDouble:balance];
    newWallet.w_date = date;
    newWallet.w_debt = [NSNumber numberWithDouble:debt];
    newWallet.w_loan = [NSNumber numberWithDouble:loan];
    newWallet.w_pword = pword;
    newWallet.w_image = image;
    
//    [newWallet setValue:name forKey:kWalletName];
//    [newWallet setValue:[NSNumber numberWithDouble:balance] forKey:kWalletBalance];
//    [newWallet setValue:date forKey:kWalletDate];
//    [newWallet setValue:[NSNumber numberWithDouble:debt] forKey:kWalletDebt];
//    [newWallet setValue:[NSNumber numberWithDouble:loan] forKey:kWalletLoan];
//    [newWallet setValue:pword forKey:kWalletPassWord];
//    [newWallet setValue:image forKey:kWalletImage];
    
    return [context save:&error];
}

+(BOOL)createWalletWithName: (NSString *)name andBalance: (double)balance andDate: (NSDate *)date andPword:(NSString*)pword andImage: (NSString*) image
{
    return [DataBaseAccess createWalletWithName:name andBalance:balance andDate:date andDebt:0.0 andLoan:0.0 andPword:pword andImage:image];
}

+(BOOL)createPlanWithName: (NSString *)name andAmount: (double)amount andStartDate: (NSDate *)startDate andExpectedDate: (NSDate *)expectedDate inWallet: (id)wallet
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    Plan *newPlan = [NSEntityDescription insertNewObjectForEntityForName:kPlan inManagedObjectContext:context];
    
    newPlan.p_name = name;
    newPlan.p_amount = [NSNumber numberWithDouble: amount];
    newPlan.p_start_date = startDate;
    newPlan.p_expected_date = expectedDate;
    newPlan.p_completed = [NSNumber numberWithBool:NO];
    newPlan.p_cancel= [NSNumber numberWithBool:NO];
    newPlan.pToWallet = wallet;
    
//    [newPlan setValue:name forKey:kPlanName];
//    [newPlan setValue:[NSNumber numberWithDouble:amount] forKey:kPlanAmount];
//    [newPlan setValue:startDate forKey:kPlanStartDate];
//    [newPlan setValue:expectedDate forKey:kPlanExpectedDate];
//    [newPlan setValue:[NSNumber numberWithBool:NO] forKey:kPlanpCompleted];
//    [newPlan setValue:[NSNumber numberWithBool:NO] forKey:kPlanCancel];
//    [newPlan setValue:wallet forKey:kPlanToWallet];
    
    return [context save:&error];
}

+(void) initData
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:kIncomeType inManagedObjectContext:context];
    NSArray *incomeType = [context executeFetchRequest:request error:&error];
    if([incomeType count] == 0)
    {
        NSArray *listExpenseType = [[NSArray alloc] initWithObjects:
                                    @"Du lịch", 
                                    @"Học tập",
                                    @"Thể thao",
                                    @"Thời trang",
                                    @"Khác",
                                   nil ];
        NSArray *listIncomeType = [[NSArray alloc] initWithObjects:
                                   @"Lương",
                                   @"Bán đồ",
                                   @"Làm thêm",
                                   @"Trợ cấp",
                                   @"Khác",
                                   nil];
        
        for(id et in listExpenseType)
        {
            ExpenseType *newET = [NSEntityDescription insertNewObjectForEntityForName:kExpenseType inManagedObjectContext:context];
            [newET setValue:et forKey:kExpenseTypeName];
        }
        
        for(id it in listIncomeType)
        {
            IncomeType *newIT = [NSEntityDescription insertNewObjectForEntityForName:kIncomeType inManagedObjectContext:context];
            [newIT setValue:it forKey:kIncomeTypeName];
        }
        [context save:&error];
    }else
        return;
    
}

+(BOOL)createIncomeWithname: (NSString *)name andAmount: (double) amount andDate: (NSDate *)date andNotes:(NSString *)notes inPlan: (id)plan ofType: (id)type
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    Income *newIncome = [NSEntityDescription insertNewObjectForEntityForName:kIncome inManagedObjectContext:context];
    [newIncome setValue:name forKey:kIncomeName];
    [newIncome setValue:[NSNumber numberWithDouble:amount] forKey:kIncomeAmount];
    [newIncome setValue:date forKey:kIncomeDate];
    [newIncome setValue:notes forKey:kIncomeNotes];
    [newIncome setValue:plan forKey:kIncomeToPlan];
    [newIncome setValue:type forKey:kIncomeToIncomeType];
    
    return [context save:&error]; 
}

+(BOOL)createExpenseWithname: (NSString *)name andAmount: (double) amount andDate: (NSDate *)date andNotes:(NSString *)notes inPlan: (id)plan ofType: (id)type
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    Expense *newExpense = [NSEntityDescription insertNewObjectForEntityForName:kExpense inManagedObjectContext:context];
    [newExpense setValue:name forKey:kExpenseName];
    [newExpense setValue:[NSNumber numberWithDouble:amount] forKey:kExpenseAmount];
    [newExpense setValue:date forKey:kExpenseDate];
    [newExpense setValue:notes forKey:kExpenseNotes];
    [newExpense setValue:plan forKey:kExpenseToPlan];
    [newExpense setValue:type forKey:kExpenseToExpenseType];
    
    return [context save:&error];
}

+(BOOL)createDebtWithName: (NSString *)name andAmount: (double)amount andDate: (NSDate *)date andExpectedDate: (NSDate *)expectedDate andLender: (NSString *)lender andNotes: (NSString *)notes inWallet: (id)wallet
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    Debt *newDebt = [NSEntityDescription insertNewObjectForEntityForName:kDebt inManagedObjectContext:context];
    
    [newDebt setValue:name forKey:kDebtName];
    [newDebt setValue:[NSNumber numberWithDouble:amount] forKey:kDebtAmount];
    [newDebt setValue:date forKey:kDebtDate];
    [newDebt setValue:expectedDate forKey:kDebtExpectedDate];
    [newDebt setValue:lender forKey:kDebtLender];
    [newDebt setValue:notes forKey:kDebtNotes];
    [newDebt setValue:wallet forKey:kDebtToWallet];
    
    return [context save:&error];
}

+(BOOL)createLoanWithName: (NSString *)name andAmount: (double)amount andDate: (NSDate *)date andExpectedDate: (NSDate *)expectedDate andBorrower: (NSString *)borrower andNotes: (NSString *)notes inWallet: (id)wallet
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    NSManagedObject *newLoan = [NSEntityDescription insertNewObjectForEntityForName:kLoan inManagedObjectContext:context];
    
    [newLoan setValue:name forKey:kLoanName];
    [newLoan setValue:[NSNumber numberWithDouble:amount] forKey:kLoanAmount];
    [newLoan setValue:date forKey:kLoanDate];
    [newLoan setValue:expectedDate forKey:kLoanExpectedDate];
    [newLoan setValue:borrower forKey:kLoanBorrower];
    [newLoan setValue:notes forKey:kLoanNotes];
    [newLoan setValue:wallet forKey:kLoanToWallet];
    
    return [context save:&error];
}

+(BOOL)createDebtHistory: (double)amount onDate: (NSDate *)date inDebt: (id)debt
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    NSManagedObject *newDebtHistory = [NSEntityDescription insertNewObjectForEntityForName:kDebtHistory inManagedObjectContext:context];
    [newDebtHistory setValue:[NSNumber numberWithDouble:amount] forKey:kDebtHistoryAmount];
    [newDebtHistory setValue:date forKey:kDebtHistoryDate];
    [newDebtHistory setValue:debt forKey:kDebtHistoryToDebt];
    
    return [context save:&error];

}

+(BOOL)createLoanHistory: (double)amount onDate: (NSDate *)date inLoan: (id)loan
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    NSManagedObject *newLoanHistory = [NSEntityDescription insertNewObjectForEntityForName:kLoanHistory inManagedObjectContext:context];
    [newLoanHistory setValue:[NSNumber numberWithDouble:amount] forKey:kLoanHistoryAmount];
    [newLoanHistory setValue:date forKey:kLoanHistoryDate];
    [newLoanHistory setValue:loan forKey:kLoanHistoryToLoan];
    
    return [context save:&error];

}

//QUERY
+(NSArray *)getAllWallet
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:kWallet inManagedObjectContext:context];
    
    NSArray *listWallet = [context executeFetchRequest:request error:&error];
    
    return listWallet;
}

+(NSArray *)getAllIncomeType
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:kIncomeType inManagedObjectContext:context];
    
    NSArray *listIncomeType = [context executeFetchRequest:request error:&error];
    
    return listIncomeType;
}

+(NSArray *)getAllExpenseType
{
    folyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:kExpenseType inManagedObjectContext:context];
    
    NSArray *listExpenseType = [context executeFetchRequest:request error:&error];
    
    return listExpenseType;
}

+(NSArray *)getAllPlanInWallet:(id)wallet
{
    NSSet *setOfPlan = ((Wallet *)wallet).wToPlan;
    NSArray *listPlan = [setOfPlan allObjects];
    return listPlan;
}

+(NSArray *)getAllLoanInWallet:(id)wallet
{
    NSSet *setOfLoan = ((Wallet *)wallet).wToLoan;
    NSArray *listLoan = [setOfLoan allObjects];
    return listLoan;
}

+(NSArray *)getAllDebtInWallet:(id)wallet
{
    NSSet *setOfDebt = ((Wallet *)wallet).wToDebt;
    NSArray *listDebt = [setOfDebt allObjects];
    return listDebt;
}

+(NSArray *)getAllIncomeInPlan:(id)plan
{
    NSSet *setOfIncome = ((Plan *)plan).pToIncome;
    NSArray *listIncome = [setOfIncome allObjects];
    return listIncome;

}

+(NSArray *)getAllExpenseInPlan:(id)plan
{
    NSSet *set = ((Plan *)plan).pToExpense;
    NSArray *list = [set allObjects];
    return list;
}

+(NSArray *)getAllIncomeInIncomeType:(id)incomeType
{
    NSSet *set = ((IncomeType *)incomeType).itToIncome;
    NSArray *list = [set allObjects];
    return list;
}

+(NSArray *)getAllExpenseInExpenseType:(id)expenseType
{
    NSSet *set = ((ExpenseType *)expenseType).etToExpense;
    NSArray *list = [set allObjects];
    return list;
}

+(NSArray *)getAllDebtHistoryInDebt:(id)debt
{
    NSSet *set = ((Debt *)debt).dToDebtHistory;
    NSArray *list = [set allObjects];
    return list;
}

+(NSArray *)getAllLoanHistoryInLoan:(id)loan
{
    NSSet *set = ((Loan *)loan).lToLoanHistory;
    NSArray *list = [set allObjects];
    return list;
}

@end
