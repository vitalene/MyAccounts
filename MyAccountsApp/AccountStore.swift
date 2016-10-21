//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts


class AccountStore {
    
    var storedAccount: Account
    
    public init () {
        storedAccount = Account(entries: [
            ], title: "My Checking Account", initialBalance: 100.0, category: .asset(isEquity: false))

        
        
    }
    
    
    

}

