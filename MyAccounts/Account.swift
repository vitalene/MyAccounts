//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


class Account {

    // Equity:  (Owners' Equity) = Assets - Liabilities
    // Assets: Assets = Liabilities + Owners' Equity
    // 
    // consider an enum here...
    
    enum Category {
    case asset(isEquity: Bool)
    case liability
    case expense
    case revenue
}
    

  //  let register = Ledger.init(with: [Transaction], with: [String], and: Float)
    
    var category: Category

    
    var entries = [Transaction]()
    
    let columnTitles: [String]
    
    let currentBalance: Float
    
    
    init(entries: [Transaction], titles: [String], balance: Float) {
        self.entries = entries
        self.columnTitles = titles
        self.currentBalance = balance
        self.category = Category.liability
    }
    
    
    
    
    
}
