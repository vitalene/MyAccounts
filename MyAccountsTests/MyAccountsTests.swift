//  Copyright © 2016 Neil Vitale. All rights reserved.

import XCTest
@testable import MyAccounts

class MyAccountsTests: XCTestCase {
    // Make a computed property called transaction
    var myTransaction: Transaction {
        return Transaction(on: Date(), description: "Hello world", amount: 9.40, lastAccountTotal: 10.0, type: .debit, currencyType: .dollar)
    }
    // Make a computed property called transaction2
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
        XCTAssertEqual(myTransaction.currencyType, .dollar)
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
    
    //    func testMakingTuple() {
    //        let myTuple = myAccount.createEntryTuple(with: myTransaction)
    //        let myTuple2 = (myTransaction, NSDecimalNumber())
    //       // XCTAssertTrue(myTuple.0 == myTuple2.0)
    //        XCTAssertTrue(myTuple.1 == myTuple2.1)
    //    }
    
    
    func testTransactionAndRunningTotalTuple() {
        let now = Date()
        let then1 = now.addingTimeInterval(30342)
        let then2 = then1.addingTimeInterval(4423432)
        let before = now.addingTimeInterval(-123122)
        
        let transaction1 = Transaction(on: then2, description: "Lemonade money", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let transaction2 = Transaction(on: then1, description: "Mittens", amount: 5, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let transaction3 = Transaction(on: before, description: "Kittens", amount: 25, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let transaction4 = Transaction(on: now, description: "Hello world", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        
        // the entries are ordered by date:
        let entries: [Transaction] = [
            transaction1, transaction2, transaction3, transaction4
        ]
        
        let entries2: [Transaction] = [
            transaction2, transaction1, transaction3, transaction4
        ]
        
        let account = Account(entries: entries, title: "My Moneys", initialBalance: 50, category: .asset(isEquity: false))
        
        let account2 = Account(entries: entries2, title: "My Moneys", initialBalance: 50, category: .asset(isEquity: false))

        
        
        let result:[(transaction: Transaction, runningTotal: NSDecimalNumber)] = account.entriesWithRunningTotals()
        
        let result2:[(transaction: Transaction, runningTotal: NSDecimalNumber)] = account2.entriesWithRunningTotals()

        
        
        // Transactions are in order by date:
        let expected: [(transaction: Transaction, runningTotal: NSDecimalNumber)] = [
            (transaction1, 40),
            (transaction2, 35),
            (transaction3, 10),
            (transaction4, 00)
        ]
        // Transactions are out of order by date
        let expectedOutOfOrder: [(transaction: Transaction, runningTotal: NSDecimalNumber)] = [
            (transaction2, 45),
            (transaction1, 35),
            (transaction3, 10),
            (transaction4, 00)
        ]
        
        XCTAssertEqual(result.count, 4)
        print("\n\n\n\n\n")
        var counter: Int = 0
        for (resultEntry, expectedEntry) in zip(result, expected) {
            XCTAssertEqual(resultEntry.transaction.amount, expectedEntry.transaction.amount, "Transaction Number: \(counter)")
            print("❤️Actual: \(resultEntry.transaction.amount) 💛Actual: \(resultEntry.runningTotal)")
            print("💙Expected: \(expectedEntry.transaction.amount) 💚Expected: \(expectedEntry.runningTotal)")
            
            XCTAssertEqual(resultEntry.runningTotal, expectedEntry.runningTotal, "Transaction Number: \(counter)")
            counter = counter + 1
        }
        print("\n\n\n\n\n")
        
        // Testing Things that are out of order by date:
        
        XCTAssertEqual(result2.count, 4)
        print("\n\n\n\n\n")
        var counter2: Int = 0
        for (resultEntry, expectedEntry) in zip(result2, expectedOutOfOrder) {
            XCTAssertEqual(resultEntry.transaction.amount, expectedEntry.transaction.amount, "Transaction Number: \(counter2)")
            print("❤️Actual: \(resultEntry.transaction.amount) 💛Actual: \(resultEntry.runningTotal)")
            print("💙Expected: \(expectedEntry.transaction.amount) 💚Expected: \(expectedEntry.runningTotal)")
            
            XCTAssertEqual(resultEntry.runningTotal, expectedEntry.runningTotal, "Transaction Number: \(counter2)")
            counter2 = counter2 + 1
        }
        print("\n\n\n\n\n")
        

    }
    
}
