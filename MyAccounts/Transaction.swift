//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


enum TransactionType {
    case debit
    case credit
}
class Transaction {
    
    var date: Date
    var userProvidedDescription: String
    var amount: [String:NSDecimalNumber]
    var transactionType: TransactionType
    var runningTotal: NSDecimalNumber
    

    
    init(on date: Date, description: String, for amount: [String:NSDecimalNumber], lastAccountTotal: NSDecimalNumber, type: TransactionType) {
        self.date = date
        self.userProvidedDescription = description
        self.amount = amount
        self.runningTotal = lastAccountTotal
        self.transactionType = type
        
    }
    
    

    
    // figure out how to do a fraction -- rename to a different name than "amount"  <NSDecimalNumber> ~~~
    
    
    //
    //    init() {
    //        date = "hi"
    //        userProvidedDescription = "hello"
    //        amount = ["this":0.9]
    //    }
    
    
    
}
