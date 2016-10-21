//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


public class Book: NSObject, NSCoding {
    
    public var aLedger: Ledger
    public var bookTitle: String
    
    public init(withLedger: Ledger, title: String) {
        self.aLedger = withLedger
        self.bookTitle = title
    }

    struct BooksKey {
        static let ledgerKey = "ledger"
        static let bookTitleKey = "bookTitle"
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
//        self = aDecoder.decodeObject(forKey: BooksKey.bookKey) as! Book
        self.aLedger = aDecoder.decodeObject(forKey: BooksKey.ledgerKey) as! Ledger
        self.bookTitle = aDecoder.decodeObject(forKey: BooksKey.bookTitleKey) as! String
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.aLedger, forKey: BooksKey.ledgerKey)
        aCoder.encode(self.bookTitle, forKey: BooksKey.bookTitleKey)
    }

    
}
    
