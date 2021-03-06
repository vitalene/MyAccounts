//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts

class AppDataStore {
    
    public var storedBooks: [Book]
    
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("books.archive")
        
    }()
    
    
    public init () {
        storedBooks = []
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as! [Book]? {
            storedBooks = archivedItems
        }
//        let transaction = Transaction(on: Date(), description: "Transaction default title", amount: 0.00 , lastAccountTotal: 0.00, type: .credit, currencyType: .dollar)
//        let account = Account(entries: [transaction], title: "Account default title", initialBalance: 0.00, category: .asset(isEquity: false))
//        let ledger = Ledger(with: [account])
//        let book = Book(withLedger: ledger, title: "default book title")
//        
//        storedBooks = [
//        book
//        ]
        
        
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(self.storedBooks, toFile: itemArchiveURL.path)
    }
 
    func add(book: Book) {
        storedBooks.append(book)
    }
    
    func remove(bookAt index: Int) {
        storedBooks.remove(at: index)
    }
}
