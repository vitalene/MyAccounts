//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts
class AccountStore {
    
    var storedAccount: Account
    
    public init () {
        storedAccount = Account(entries: [
            Transaction(on: Date(), description: "Burritos", amount: 10.0, lastAccountTotal: 50.0, type: .credit, currencyType: .dollar),
            Transaction(on: Date(), description: "Apples", amount: 10.0, lastAccountTotal: 50.0, type: .credit, currencyType: .dollar),
            Transaction(on: Date(), description: "Rent", amount: 10.0, lastAccountTotal: 50.0, type: .credit, currencyType: .dollar)
            ], title: "My Checking Account", initialBalance: 100.0, category: .asset(isEquity: false))

        
    }
    
    
    public func updateCurrentTotal(newCurrentTotal: NSDecimalNumber) {
        storedAccount.currentBalance = newCurrentTotal
    }
    
}

