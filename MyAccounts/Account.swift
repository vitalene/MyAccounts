//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


class Account {
    
    // Equity:  (Owners' Equity) = Assets - Liabilities
    // Assets: Assets = Liabilities + Owners' Equity
    //
    // consider an enum here...
    enum AccountCategory {
        case asset(isEquity: Bool)
        case liability
        case expense
        case revenue
    }
    
    var accountTitles = Set<String>()
    
    
    //  let register = Ledger.init(with: [Transaction], with: [String], and: Float)
    var category: AccountCategory
    var entries = [Transaction]()
    var title: String
    let currentBalance: NSDecimalNumber
    var runningTotal: NSDecimalNumber
    
    // initialize the account
    init(entries: [Transaction], title: String, initialBalance: NSDecimalNumber, category: AccountCategory) {
        self.entries = entries
        self.title = title
        self.currentBalance = initialBalance
        self.category = category
        self.runningTotal = initialBalance
    }
    // get the amount of the last transaction in the array
    func lastTransactionAmount(transactionArray: [Transaction]) -> NSDecimalNumber {
        return (transactionArray.last?.amount["Total"])!
    }
    
    // return a total given two transaction amounts
    func getNewTotal(newTransaction: Transaction) -> NSDecimalNumber {
        
        switch newTransaction.transactionType {
        case .debit:
            return self.currentBalance.adding(newTransaction.amount["Total"]!)
        case .credit:
            return self.currentBalance.subtracting(newTransaction.amount["Total"]!)
        }
    }
    // add all the totals for all the transactions
    func makeTotalForAccount(with Amounts: [Transaction]) -> NSDecimalNumber {
        var totalInAccount: NSDecimalNumber = 0.00
        for transaction in Amounts {
            totalInAccount.adding(transaction.amount["Total"]!)
        }
        return totalInAccount
    }
    
}
