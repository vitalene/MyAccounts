//  Copyright © 2016 Neil Vitale. All rights reserved.

import XCTest
@testable import MyAccounts

class MyAccountsTests: XCTestCase {
    let myTransaction = Transaction(on: Date(), description: "Hello world", amount: ["Total": 9.40], lastAccountTotal: 10.0, type: .debit, currencyType: .dollar)
    let myAccount = Account(entries: [], title: "hello there", initialBalance: 10.0, category: .asset(isEquity: true))
    let myLedger = Ledger(with: [])
    
    //  let myBook = Book(withLedger: )
    
    
    func testNotNil() {
        XCTAssertNotNil(myTransaction)
        XCTAssertNotNil(myAccount)
        XCTAssertNotNil(myLedger)
        
    }
    
    func testRightNumber() {
        XCTAssertEqual(myTransaction.transactionType, .debit)
        XCTAssertEqual(myTransaction.currencyType, .dollar)
        XCTAssertEqual(myTransaction.userProvidedDescription, "Hello world")
        XCTAssertEqual(myTransaction.amount["Total"], 9.40)
    }
    
    func testAdding() {
        XCTAssertEqual(myTransaction.amount["Total"]?.adding(10.0), 19.40)
    }
    func testSubtracting () {
        XCTAssertEqual(myTransaction.amount["Total"]?.subtracting(5.0), 4.40)
    }
    
}
