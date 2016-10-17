//  Copyright © 2016 Neil Vitale. All rights reserved.

import XCTest
@testable import MyAccounts

class OutOfOrderTuples: XCTestCase {
   
    /// tests when transactions are out of order by date
    func testTransactionAndRunningTotalTupleOutOfOrder() {
        
        let date1 = Date()
        let date2 = date1.addingTimeInterval(30342)
        let date3 = date2.addingTimeInterval(4423432)
        let date0 = date1.addingTimeInterval(-123122)
        
        let trans3 = Transaction(on: date3, description: "Lemonade money", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let trans2 = Transaction(on: date2, description: "Mittens", amount: 5, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let trans0 = Transaction(on: date0, description: "Kittens", amount: 25, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        let trans1 = Transaction(on: date1, description: "Hello world", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
        
        
        let entries2: [Transaction] = [
            trans2, trans3, trans0, trans1
        ]
        
        let account2 = Account(entries: entries2, title: "My Moneys", initialBalance: 50, category: .asset(isEquity: false))
        
        let result2:[(transaction: Transaction, runningTotal: NSDecimalNumber)] = account2.entriesWithRunningTotals()
        
        
        // Transactions are out of order by date
        let expectedOutOfOrder: [(transaction: Transaction, runningTotal: NSDecimalNumber)] = [
            (trans2, 45),
            (trans3, 35),
            (trans0, 10),
            (trans1, 00)
        ]
        
        
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
