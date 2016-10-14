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
    public let currentBalance: NSDecimalNumber
    public var runningTotal: NSDecimalNumber
    public var initialBalance: NSDecimalNumber
    
    
    // initialize the account
    public init(entries: [Transaction], title: String, initialBalance: NSDecimalNumber, category: AccountCategory) {
        self.entries = entries
        self.title = title
        self.currentBalance = initialBalance
        self.category = category
        self.initialBalance = initialBalance
        self.runningTotal = initialBalance
    }
    // get the amount of the last transaction in the array
    public func lastTransactionAmount(transactionArray: [Transaction]) -> NSDecimalNumber {
        return (transactionArray.last?.amount)!
    }
    
    // return a total given two transaction amounts
    public func getNewTotal(newTransaction: Transaction) -> NSDecimalNumber {
        switch newTransaction.transactionType {
        case .debit:
            return self.currentBalance.adding(newTransaction.amount)
        case .credit:
            return self.currentBalance.subtracting(newTransaction.amount)
        }
    }
    // add all the totals for all the transactions
    public func makeTotalForAccount(with Amounts: [Transaction]) -> NSDecimalNumber {
        var totalInAccount: NSDecimalNumber = 0.00
        for transaction in Amounts {
            totalInAccount = totalInAccount.adding(transaction.amount)
        }
        return totalInAccount
    }
    
    // Creates a tuple for the view to be populated
    public func createEntryTuple(with Transaction: Transaction) -> (transaction: Transaction, runningTotal: NSDecimalNumber) {
        let getTotal: NSDecimalNumber = getNewTotal(newTransaction: Transaction)
        
        return (transaction: Transaction , runningTotal: getTotal)
    }
    
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
    
    // take the tuple and make it into a dictionary to populate the cells
    public func unpackEntryTuple(theTransaction: Transaction, theTotal: NSDecimalNumber) -> Dictionary<String, Any> {
        var returnDictionary = Dictionary<String, Any>()
        for parts in 1...4 {
            switch parts {
            case 1:
                returnDictionary["Date"] = theTransaction.date
            case 2:
                returnDictionary["Description"] = theTransaction.userProvidedDescription
            case 3:
                returnDictionary["Amount"] = theTransaction.amount
            case 4:
                returnDictionary["RunningTotal"] = theTotal
            default:
                print("What happened?")
            }
        }
        return returnDictionary
        
    }
}


