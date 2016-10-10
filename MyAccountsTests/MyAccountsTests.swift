//  Copyright © 2016 Neil Vitale. All rights reserved.

import XCTest
@testable import MyAccounts

class MyAccountsTests: XCTestCase {
    let myTransaction = Transaction(on: Date(), description: "hello world", for: ["hello": 8])
    let myAccount = Account(entries: [], titles: ["hi", "hello"], balance: 9.0, category: .asset(isEquity: true))
    let myLedger = Ledger(with: [])
    
  //  let myBook = Book(withLedger: )
    
    
    func testNotNil() {
       XCTAssertNil(<#T##expression: Any?##Any?#>)
        
    }
    
    
    
}
