//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts

class AppDataStore {
    
    public var storedBooks: [Book]
    
    public init () {
        let transaction = Transaction(on: Date(), description: "hello", amount: 8.0, lastAccountTotal: 90.00, type: .credit, currencyType: .dollar)
        
        
        
        storedBooks = [
        Book(withLedger: Ledger(with: [Account(entries: [transaction], title: "yes and yes", initialBalance: 190.00, category: .asset(isEquity: false))]), with: "yo yo yo world")
            
        
        ]
        
        
    }
    
    
    
}
