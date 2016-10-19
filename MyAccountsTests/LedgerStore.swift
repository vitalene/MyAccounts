//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts


class LedgerStore {
    
    var storedLedger: Ledger
    
    public init () {
        storedLedger = Ledger(with: [
            Account(entries: [
                Transaction(on: Date(), description: "stuff", amount: 8.00, lastAccountTotal: 88.00, type: .credit, currencyType: .dollar)
                ], title: "My Checking Account", initialBalance: 90.0, category: .asset(isEquity: false))
            ])
        
        
    }
    
    

    
}

