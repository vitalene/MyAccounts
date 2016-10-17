//  Copyright © 2016 Neil Vitale. All rights reserved.

import XCTest
@testable import MyAccounts

class TestAddingATransaction: XCTestCase {
    
    
    // create an account with transactions
    var myAccount: Account = Account(entries: [
        Transaction(on: Date(), description: "Hello world", amount: 9.40, lastAccountTotal: 10.0, type: .debit, currencyType: .dollar),
        Transaction(on: Date(), description: "Hello world", amount: 9.40, lastAccountTotal: 11.0, type: .debit, currencyType: .dollar)
        ], title: "hello there", initialBalance: 10.0, category: .asset(isEquity: true))
    
    
    func testAddingATransaction() {
        let myTransaction3: Transaction = Transaction(on: Date(), description: "A new Transaction", amount: 22.00, lastAccountTotal: 15.00, type: .credit, currencyType: .dollar)
        
        self.myAccount.addATransaction(withTransaction: myTransaction3)
        
        XCTAssert(self.myAccount.entries.count == 3)
        
        
    }
    
}



