//
//  Attributes.h
//  Wallets Manager
//
//  Created by Nguyen Chi Cong on 9/24/12.
//  Copyright (c) 2012 BKHN. All rights reserved.
//

#import "Wallet.h"
#import "Plan.h"
#import "LoanHistory.h"
#import "Loan.h"
#import "IncomeType.h"
#import "Income.h"
#import "Expense.h"
#import "ExpenseType.h"
#import "Debt.h"
#import "DebtHistory.h"

#define kWallet             @"Wallet"
#define kWalletName         @"w_name"
#define kWalletBalance      @"w_balance"
#define kWalletDate         @"w_date"
#define kWalletPassWord     @"w_pword"
#define kWalletImage        @"w_image"
#define kWalletDebt         @"w_debt"
#define kWalletLoan         @"w_loan"
#define kWalletToPlan       @"wToPlan"
#define kWalletToDebt       @"wToDebt"
#define kWalletToLoan       @"wToLoan"

#define kPlan               @"Plan"
#define kPlanAmount         @"p_amount"
#define kPlanCancel         @"p_cancel"
#define kPlanpCompleted     @"p_completed"
#define kPlanExpectedDate   @"p_expected_date"
#define kPlanCompletedDate  @"p_real_completed_date"
#define kPlanName           @"p_name"
#define kPlanStartDate      @"p_start_date"
#define kPlanToWallet       @"pToWallet"

#define kIncomeType             @"IncomeType"
#define kIncomeTypeName         @"it_name"
#define kIncomeTypeToIncome     @"itToIncome"

#define kExpenseType            @"ExpenseType"
#define kExpenseTypeName        @"et_name"
#define kExpenseTypeToExpense   @"etToExpense"

#define kIncome             @"Income"
#define kIncomeName         @"i_name"
#define kIncomeAmount       @"i_amount"
#define kIncomeDate         @"i_date"
#define kIncomeNotes        @"i_notes"
#define kIncomeToIncomeType @"iToIncomeType"
#define kIncomeToPlan       @"iToPlan"

#define kExpense                @"Expense"
#define kExpenseName            @"e_name"
#define kExpenseAmount          @"e_amount"
#define kExpenseDate            @"e_date"
#define kExpenseNotes           @"e_notes"
#define kExpenseToExpenseType   @"eToExpenseType"
#define kExpenseToPlan          @"eToPlan"

#define kDebt                   @"Debt"
#define kDebtName               @"d_name"
#define kDebtAmount             @"d_amount"
#define kDebtDate               @"d_date"
#define kDebtExpectedDate       @"d_expected_date"
#define kDebtFinished           @"d_finished"
#define kDebtLender             @"d_lender"
#define kDebtNotes              @"d_notes"
#define kDebtToWallet           @"dToWallet"
#define kDebtToHistory          @"dToDebtHistory"

#define kLoan                   @"Loan"
#define kLoanName               @"l_name"
#define kLoanAmount             @"l_amount"
#define kLoanDate               @"l_date"
#define kLoanExpectedDate       @"l_expected_date"
#define kLoanFinished           @"l_finished"
#define kLoanBorrower           @"l_borrower"
#define kLoanNotes              @"l_notes"
#define kLoanToWallet           @"lToWallet"
#define kLoanToHistory          @"lToLoanHistory"

#define kLoanHistory            @"LoanHistory"
#define kLoanHistoryAmount      @"lh_amount"
#define kLoanHistoryDate        @"lh_date"
#define kLoanHistoryToLoan      @"lhToLoan"

#define kDebtHistory            @"DebtHistory"
#define kDebtHistoryAmount      @"dh_amount"
#define kDebtHistoryDate        @"dh_date"
#define kDebtHistoryToDebt      @"dhToDebt"
















