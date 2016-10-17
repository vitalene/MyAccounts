//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


public class Account {
    
    // Equity:  (Owners' Equity) = Assets - Liabilities
    // Assets: Assets = Liabilities + Owners' Equity
    //
    // consider an enum here...
    public enum AccountCategory {
        case asset(isEquity: Bool)
        case liability
        case expense
        case revenue
    }
    
    //  let register = Ledger.init(with: [Transaction], with: [String], and: Float)
    public var category: AccountCategory
    public var entries = [Transaction]()
    public var title: String
    public var runningTotal: NSDecimalNumber
    public var initialBalance: NSDecimalNumber
    public var currentBalance: NSDecimalNumber
    
    /// initialize the account
    public init(entries: [Transaction], title: String, initialBalance: NSDecimalNumber, category: AccountCategory) {
        self.entries = entries
        self.title = title
        self.category = category
        self.initialBalance = initialBalance
        self.runningTotal = initialBalance
        self.currentBalance = initialBalance
        for entry in entries {
            switch entry.transactionType {
            case .credit:
               self.currentBalance = self.currentBalance.subtracting(entry.amount)
            case .debit:
                self.currentBalance = self.currentBalance.adding(entry.amount)
            }
        }
        
    }
    /// Appends a transaction to the transaction array
    public func addATransaction(withTransaction: Transaction) {
        self.entries.append(withTransaction)
        switch withTransaction.transactionType {
        case .credit:
            self.currentBalance = self.currentBalance.subtracting(withTransaction.amount)
        case .debit:
            self.currentBalance = self.currentBalance.adding(withTransaction.amount)
        }
    }
    
    
    /// get the amount of the last transaction in the array
    public func lastTransactionAmount(transactionArray: [Transaction]) -> NSDecimalNumber {
        return (transactionArray.last?.amount)!
    }
    
    /// return a total given two transaction amounts
    public func getNewTotal(newTransaction: Transaction) -> NSDecimalNumber {
        switch newTransaction.transactionType {
        case .debit:
            return self.currentBalance.adding(newTransaction.amount)
        case .credit:
            return self.currentBalance.subtracting(newTransaction.amount)
        }
    }
    /// add all the totals for all the transactions
    public func makeTotalForAccount(with Amounts: [Transaction]) -> NSDecimalNumber {
        var totalInAccount: NSDecimalNumber = 0.00
        for transaction in Amounts {
            totalInAccount = totalInAccount.adding(transaction.amount)
        }
        return totalInAccount
    }
    
    /// Creates a tuple for the view to be populated
    public func createEntryTuple(with Transaction: Transaction) -> (transaction: Transaction, runningTotal: NSDecimalNumber) {
        let getTotal: NSDecimalNumber = getNewTotal(newTransaction: Transaction)
        return (transaction: Transaction , runningTotal: getTotal)
    }
    
    /// Creates running totals and apppends them to the transaction inside a tuple
    public func entriesWithRunningTotals() -> [(transaction: Transaction, runningTotal: NSDecimalNumber)] {
        var returnArray: [(transaction: Transaction, runningTotal: NSDecimalNumber)] = []
        var counter = 0
        for entry in entries {
            switch entry.transactionType {
            case .debit:
                if counter == 0 {
                    let runningTotalToReturn = self.initialBalance.adding(entry.amount)
                    returnArray.append((entry, runningTotalToReturn))
                    counter = counter + 1
                } else {
                    let runningTotalToReturn = returnArray[counter - 1].runningTotal.adding(entry.amount)
                    returnArray.append((entry, runningTotalToReturn))
                    counter = counter + 1
                }
            case .credit:
                if counter == 0 {
                    let runningTotalToReturn = self.initialBalance.subtracting(entry.amount)
                    returnArray.append((entry, runningTotalToReturn))
                    counter = counter + 1
                } else {
                    let runningTotalToReturn = returnArray[counter - 1].runningTotal.subtracting(entry.amount)
                    returnArray.append((entry, runningTotalToReturn))
                    counter = counter + 1
                }
            }
        }
        return returnArray
    }
}


