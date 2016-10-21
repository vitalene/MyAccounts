//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


public enum TransactionType {
    case debit
    case credit
}
public enum CurrencyType {
    case dollar
}

public class Transaction: NSObject, NSCoding {
    
   public var date: Date
    public var userProvidedDescription: String
    public var amount: NSDecimalNumber
    public var transactionType: TransactionType
    public var CurrencyType: CurrencyType
    // initialize the transaction
    public init(on date: Date, description: String, amount: NSDecimalNumber, lastAccountTotal: NSDecimalNumber, type: TransactionType, currencyType: CurrencyType) {
        self.date = date
        self.userProvidedDescription = description
        self.amount = amount
        self.transactionType = type
        self.CurrencyType = currencyType
        
    }
    
    struct TransactionKeys {
        static let dateKey = "date"
        static let userProvidedDescriptionKey = "userProvidedDescription"
        static let amountKey = "amount"
        static let transactionTypeKey = "transactionType"
        static let currencyTypeKey = "currencyType"
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObject(forKey: TransactionKeys.dateKey) as! Date
        self.userProvidedDescription = aDecoder.decodeObject(forKey: TransactionKeys.userProvidedDescriptionKey) as! String
        self.amount = aDecoder.decodeObject(forKey: TransactionKeys.amountKey) as! NSDecimalNumber
        self.transactionType = aDecoder.decodeObject(forKey: TransactionKeys.transactionTypeKey) as! TransactionType
        self.CurrencyType = aDecoder.decodeObject(forKey: TransactionKeys.currencyTypeKey) as! CurrencyType
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.date, forKey: TransactionKeys.dateKey)
        aCoder.encode(self.userProvidedDescription, forKey: TransactionKeys.userProvidedDescriptionKey)
        aCoder.encode(self.amount, forKey: TransactionKeys.amountKey)
        aCoder.encode(self.transactionType, forKey: TransactionKeys.transactionTypeKey)
        aCoder.encode(self.CurrencyType, forKey: TransactionKeys.currencyTypeKey)
    }
    
    
    // Make a date for the transaction
    public func addADate(with Date: Date) {
        self.date = Date
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
    
    public func selectACurrency() -> CurrencyType {
        return .dollar
    }
    
}

//extension Transaction: Equatable {}
//
//public func ==(lhs: Transaction, rhs: Transaction) -> Bool {
//    let areEqual = lhs.date == rhs.date && lhs.userProvidedDescription == rhs.userProvidedDescription && lhs.amount == rhs.amount && lhs.CurrencyType == rhs.CurrencyType && lhs.transactionType == rhs.transactionType
//    
//    return areEqual
//}
