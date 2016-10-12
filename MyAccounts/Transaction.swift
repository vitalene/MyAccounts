//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


enum TransactionType {
    case debit
    case credit
}
enum currencyType {
    case dollar
}

class Transaction {
    
    var date: Date
    var userProvidedDescription: String
    var amount: NSDecimalNumber
    var transactionType: TransactionType
    var currencyType: currencyType
    
    // initialize the transaction
    init(on date: Date, description: String, amount: NSDecimalNumber, lastAccountTotal: NSDecimalNumber, type: TransactionType, currencyType: currencyType) {
        self.date = date
        self.userProvidedDescription = description
        self.amount = amount
        self.transactionType = type
        self.currencyType = currencyType
    }
    // Make a date for the transaction
    func addADate(with Date: Date) -> Date {
        return Date
    }
    // Describe the transaction
    func addADescription(with Input: String ) -> String  {
        return Input
    }
    // credit or debit?
    func chooseATransactionType(isDebit: Bool) -> TransactionType {
        if isDebit == true {
            return .debit
        } else {
            return .credit
        }
    }
    
    func selectACurrency() -> currencyType {
        return .dollar
    }
    
}

extension Transaction: Equatable {}

func ==(lhs: Transaction, rhs: Transaction) -> Bool {
    let areEqual = lhs.date == rhs.date && lhs.userProvidedDescription == rhs.userProvidedDescription && lhs.amount == rhs.amount && lhs.currencyType == rhs.currencyType && lhs.transactionType == rhs.transactionType
    
    return areEqual
}
