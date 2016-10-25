//  Copyright © 2016 Neil Vitale. All rights reserved.

import XCTest
@testable import MyAccounts

class MyAccountsTests: XCTestCase {
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
    // Do any set up before each test runs
    override func setUp() {
        super.setUp()
    }
    // Are any of these nil?
    func testNotNil() {
        let myLedger = Ledger(with: [])
        XCTAssertNotNil(myTransaction)
        XCTAssertNotNil(myTransaction2)
        XCTAssertNotNil(myAccount)
        XCTAssertNotNil(myLedger)
        
    }
    // do the properties match these values
    func testRightNumber() {
        XCTAssertEqual(myTransaction.transactionType, .debit)
      //  XCTAssertEqual(myTransaction.currencyType, .dollar)
        XCTAssertEqual(myTransaction.userProvidedDescription, "Hello world")
        XCTAssertEqual(myTransaction.amount, 9.40)
    }
    // Does adding work
    func testAdding() {
        XCTAssertEqual(myTransaction.amount.adding(10.0), 19.40)
    }
    // Does subracting work
    func testSubtracting () {
        XCTAssertEqual(myTransaction.amount.subtracting(5.0), 4.40)
    }
    // Can you sum the values correctly
    func testAccountTotal () {
        var myTotal: NSDecimalNumber = 0.00
        for transaction in myAccount.entries {
            myTotal = myTotal.adding(transaction.amount)
        }
        XCTAssertEqual(myTotal, 18.8)
        
    }
    
    
}
