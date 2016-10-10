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
    var amount: [String:NSDecimalNumber]
    var transactionType: TransactionType
    var currencyType: currencyType

    
    init(on date: Date, description: String, for amount: [String:NSDecimalNumber], lastAccountTotal: NSDecimalNumber, type: TransactionType, currencyType: currencyType) {
        self.date = date
        self.userProvidedDescription = description
        self.amount = amount
        self.transactionType = type
        self.currencyType = currencyType
        
    }
    
    

    
    // figure out how to do a fraction -- rename to a different name than "amount"  <NSDecimalNumber> ~~~
    
    
    //
    //    init() {
    //        date = "hi"
    //        userProvidedDescription = "hello"
    //        amount = ["this":0.9]
    //    }
    
    
    
}
