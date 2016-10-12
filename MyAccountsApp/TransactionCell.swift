//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts

class TransactionCell: UITableViewCell {
    
    var plants: [String] = ["🌵", "🍇", "🌲"]
    
    @IBOutlet var theDate: UILabel!
    
    @IBOutlet var theDescription: UILabel! {
        didSet {
            theDescription.text = plants[0]
        }
    }
    
    @IBOutlet var theAmount: UILabel!{
        didSet {
            theAmount.text = plants[1]
        }
    }
    @IBOutlet var theRunningTotal: UILabel! {
        didSet {
            theRunningTotal.text = plants[2]
        }
    }
    
    
    
}
