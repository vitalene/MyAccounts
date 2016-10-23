//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation



public class Account: NSObject, NSCoding {
    
    // Equity:  (Owners' Equity) = Assets - Liabilities
    // Assets: Assets = Liabilities + Owners' Equity
    //
    // consider an enum here...
    
    public enum AccountCategory: RawRepresentable {
        public typealias RawValue = (Int, Bool)
        
        case asset(isEquity: Bool) 
        case liability
        case expense
        case revenue
        
        public var rawValue: (Int, Bool) {
            switch self {
            case let .asset(isEquity):
                return (0, isEquity)
            case .liability:
                return (1, false)
            case .expense:
                return (2, false)
            case .revenue:
                return (3, false)
            }
        }
        public init?(rawValue: RawValue) {
            switch rawValue {
            case let (0, isEquity):
                self = .asset(isEquity: isEquity)
            case (1, _):
                self = .liability
            case (2, _):
                self = .expense
            case (3, _):
                self = .revenue
            default:
                return nil
            }
        }
        
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
        self.category = category
        self.entries = entries
        self.title = title
        self.runningTotal = initialBalance
        self.initialBalance = initialBalance
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
    
    struct AccountKeys {
        static let categoryKey = "category"
        static let entriesKey = "entries"
        static let titleKey = "title"
        static let runningTotalKey = "runningTotal"
        static let initialBalanceKey = "initialBalance"
        static let currentBalanceKey = "currentBalance"
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.category = aDecoder.decodeObject(forKey: AccountKeys.categoryKey) as! AccountCategory
        self.entries = aDecoder.decodeObject(forKey: AccountKeys.entriesKey) as! [Transaction]
        self.title = aDecoder.decodeObject(forKey: AccountKeys.titleKey) as! String
        self.initialBalance = aDecoder.decodeObject(forKey: AccountKeys.initialBalanceKey) as! NSDecimalNumber
        self.runningTotal = aDecoder.decodeObject(forKey: AccountKeys.runningTotalKey) as! NSDecimalNumber
        self.currentBalance = aDecoder.decodeObject(forKey: AccountKeys.currentBalanceKey) as! NSDecimalNumber
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.category, forKey: AccountKeys.categoryKey)
        aCoder.encode(self.entries, forKey: AccountKeys.entriesKey)
        aCoder.encode(self.title, forKey: AccountKeys.titleKey)
        aCoder.encode(self.initialBalance, forKey: AccountKeys.initialBalanceKey)
        aCoder.encode(self.runningTotal, forKey: AccountKeys.runningTotalKey)
        aCoder.encode(self.currentBalance, forKey: AccountKeys.currentBalanceKey)
        
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
    /// removes a transaction from the transaction array fitting the description
    public func removeATransaction(withTransaction: Transaction) {
        self.entries.remove(at: self.entries.index(of: withTransaction)!)
        switch withTransaction.transactionType {
        case .credit:
            self.currentBalance = self.currentBalance.adding(withTransaction.amount)
        case .debit:
            self.currentBalance = self.currentBalance.subtracting(withTransaction.amount)
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


