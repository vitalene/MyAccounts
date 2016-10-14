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
        let date1 = Date()
        let date2 = date1.addingTimeInterval(30342)
        let date3 = date2.addingTimeInterval(4423432)
        let date0 = date1.addingTimeInterval(-123122)
        
        let trans3 = Transaction(on: date3, description: "Lemonade money", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let trans2 = Transaction(on: date2, description: "Mittens", amount: 5, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let trans0 = Transaction(on: date0, description: "Kittens", amount: 25, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let trans1 = Transaction(on: date1, description: "Hello world", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        
        // the entries are ordered by date:
        let entries: [Transaction] = [
            trans3, trans2, trans0, trans1
        ]
        
        let entries2: [Transaction] = [
            trans2, trans3, trans0, trans1
        ]
        
        let account = Account(entries: entries, title: "My Moneys", initialBalance: 50, category: .asset(isEquity: false))
        
        let account2 = Account(entries: entries2, title: "My Moneys", initialBalance: 50, category: .asset(isEquity: false))

        
        
        let result:[(transaction: Transaction, runningTotal: NSDecimalNumber)] = account.entriesWithRunningTotals()
        
        let result2:[(transaction: Transaction, runningTotal: NSDecimalNumber)] = account2.entriesWithRunningTotals()

        
        
        // Transactions are in order by date:
        let expected: [(transaction: Transaction, runningTotal: NSDecimalNumber)] = [
            (trans3, 40),
            (trans2, 35),
            (trans0, 10),
            (trans1, 00)
        ]
        // Transactions are out of order by date
        let expectedOutOfOrder: [(transaction: Transaction, runningTotal: NSDecimalNumber)] = [
            (trans2, 45),
            (trans3, 35),
            (trans0, 10),
            (trans1, 00)
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
