//  Copyright © 2016 Neil Vitale. All rights reserved.

import XCTest
@testable import MyAccounts
class TestTheCurrentBalance: XCTestCase {
    
    // Make a computed property called myTransaction
    var myTransaction: Transaction {
        return Transaction(on: Date(), description: "Hello world", amount: 9.40, lastAccountTotal: 10.0, type: .debit, currencyType: .dollar)
    }
    // Make a computed property called myTransaction2
    var myTransaction2: Transaction {
        return Transaction(on: Date(), description: "Hello world", amount: 9.40, lastAccountTotal: 11.0, type: .debit, currencyType: .dollar)
    }

    // create an account
    var myAccount: Account {
        return Account(entries: [myTransaction, myTransaction2], title: "hello there", initialBalance: 10.0, category: .asset(isEquity: true))
    }
    
    func testForCorrectBalance() {
        XCTAssert(myAccount.currentBalance == 28.8)
        
    }
    
    
}
