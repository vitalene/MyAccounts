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
        return (transactionArray.last?.amount)!
    }
    
    // return a total given two transaction amounts
    func getNewTotal(newTransaction: Transaction) -> NSDecimalNumber {
        switch newTransaction.transactionType {
        case .debit:
            return self.currentBalance.adding(newTransaction.amount)
        case .credit:
            return self.currentBalance.subtracting(newTransaction.amount)
        }
    }
    // add all the totals for all the transactions
    func makeTotalForAccount(with Amounts: [Transaction]) -> NSDecimalNumber {
        var totalInAccount: NSDecimalNumber = 0.00
        for transaction in Amounts {
            totalInAccount = totalInAccount.adding(transaction.amount)
        }
        return totalInAccount
    }
    
    // Creates a tuple for the view to be populated
    func createEntryTuple(with Transaction: Transaction) -> (Transaction, NSDecimalNumber) {
        let getTotal: NSDecimalNumber = getNewTotal(newTransaction: Transaction)
        
        return (theTransaction: Transaction , theRunningTotal: getTotal)
    }
    
    
    // take the tuple and make it into a dictionary to populate the cells
    func unpackEntryTuple(theTransaction: Transaction, theTotal: NSDecimalNumber) -> Dictionary<String, Any> {
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
