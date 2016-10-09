//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation

class Transaction {
    
    var date: Date
    var userProvidedDescription: String
    var amount: [String:NSDecimalNumber]
    
    init(on date: Date, description: String, for amount: [String:NSDecimalNumber]) {
        self.date = date
        self.userProvidedDescription = description
        self.amount = amount
        
    }
    
    // figure out how to do a fraction -- rename to a different name than "amount"  <NSDecimalNumber> ~~~
    
    
    //
    //    init() {
    //        date = "hi"
    //        userProvidedDescription = "hello"
    //        amount = ["this":0.9]
    //    }
    
    
    
}
