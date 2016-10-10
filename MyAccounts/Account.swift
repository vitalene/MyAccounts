//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


class Account {
    
    // Equity:  (Owners' Equity) = Assets - Liabilities
    // Assets: Assets = Liabilities + Owners' Equity
    //
    // consider an enum here...
    enum Category {
        case asset(isEquity: Bool)
        case liability
        case expense
        case revenue
    }
    //  let register = Ledger.init(with: [Transaction], with: [String], and: Float)
    var category: Category
    var entries = [Transaction]()
    let columnTitles: [String]
    let currentBalance: NSDecimalNumber
    var runningTotal: NSDecimalNumber
    
    
    init(entries: [Transaction], titles: [String], balance: NSDecimalNumber, category: Category) {
        self.entries = entries
        self.columnTitles = titles
        self.currentBalance = balance
        self.category = category
        self.runningTotal = balance
    }
    
    func getNewTotal(latestTransaction: Transaction, latestTransAmount: NSDecimalNumber, lastTotal: NSDecimalNumber) -> NSDecimalNumber {
        switch latestTransaction.transactionType {
        case .debit:
            return lastTotal.adding(latestTransAmount)
        case .credit:
            return lastTotal.subtracting(latestTransAmount)
        }
    }
    
    
    
}
