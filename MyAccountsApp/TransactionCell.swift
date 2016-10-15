//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts


class TransactionCell: UITableViewCell {
    
    // Make a behavior in order to format the transaction amount
    static let numberHandler = NSDecimalNumberHandler(roundingMode: .bankers, scale: 2, raiseOnExactness: true, raiseOnOverflow: true, raiseOnUnderflow: true, raiseOnDivideByZero: true)
    // Format the date string
    static var dateFormatter: DateFormatter = {
        let fmtr = DateFormatter()
        let myLocale = Locale(identifier: "bg_BG")
        fmtr.dateStyle = .medium
        fmtr.locale = myLocale
        return fmtr
    }()
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var runningTotalLabel: UILabel!
}
