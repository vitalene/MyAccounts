//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


public enum TransactionType {
    case debit
    case credit
}
public enum currencyType {
    case dollar
}

public class Transaction {
    
   public var date: Date
    public var userProvidedDescription: String
    public var amount: NSDecimalNumber
    public var transactionType: TransactionType
    public var currencyType: currencyType
    // initialize the transaction
    public init(on date: Date, description: String, amount: NSDecimalNumber, lastAccountTotal: NSDecimalNumber, type: TransactionType, currencyType: currencyType) {
        self.date = date
        self.userProvidedDescription = description
        self.amount = amount
        self.transactionType = type
        self.currencyType = currencyType
        
    }
    // Make a date for the transaction
    public func addADate(with Date: Date) -> Date {
        return Date
    }
    // Describe the transaction
    public func addADescription(with Input: String )  {
        self.userProvidedDescription = Input
    }
    // credit or debit?
    public func chooseATransactionType(isDebit: Bool) -> TransactionType {
        if isDebit == true {
            return .debit
        } else {
            return .credit
        }
    }
    
    public func selectACurrency() -> currencyType {
        return .dollar
    }
    
}

extension Transaction: Equatable {}

public func ==(lhs: Transaction, rhs: Transaction) -> Bool {
    let areEqual = lhs.date == rhs.date && lhs.userProvidedDescription == rhs.userProvidedDescription && lhs.amount == rhs.amount && lhs.currencyType == rhs.currencyType && lhs.transactionType == rhs.transactionType
    
    return areEqual
}
