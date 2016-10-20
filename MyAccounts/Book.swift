//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


public class Book {
    
    public var aLedger: Ledger
    public var bookTitle: String
    
    public init(withLedger: Ledger, with title: String) {
        self.aLedger = withLedger
        self.bookTitle = title
    }
    
    
}
    
