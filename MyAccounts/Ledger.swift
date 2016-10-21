//  Copyright © 2016 Neil Vitale. All rights reserved.


import Foundation


public class Ledger: NSObject, NSCoding {
    
    public let accounts: [Account]
    
    public init(with accounts: [Account]) {
        self.accounts = accounts
    }
    
    struct AccountsKeys {
        static let accountsKey = "accounts"
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.accounts = aDecoder.decodeObject(forKey: AccountsKeys.accountsKey) as! [Account]
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.accounts, forKey: AccountsKeys.accountsKey)
    }
    
    
}







