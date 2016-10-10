//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


class DollarAmount {
    
    var amountRounded: NSDecimalNumber
    
    init(stringAmount: String) {
        let amount = NSDecimalNumber.init(string: stringAmount)
        let behavior = NSDecimalNumberHandler.init(roundingMode: NSDecimalNumber.RoundingMode.bankers, scale: 2, raiseOnExactness: true, raiseOnOverflow: true, raiseOnUnderflow: true, raiseOnDivideByZero: true)
        amountRounded = amount.rounding(accordingToBehavior: behavior)
    }

    
    
    
    
}
