//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts


class TransactionCell: UITableViewCell {
    
    var plants: [String] = ["🌵", "🍇", "🌲"]
    // Make a test transaction
    var transactionTest: Transaction {
        let transTest = Transaction.init(on: Date(), description: "hello world", amount: 9.87, lastAccountTotal: 10.0, type: .debit, currencyType: .dollar)
        return transTest
    }
    // Make a behavior in order to format the transaction amount
    let behavior = NSDecimalNumberHandler.init(roundingMode: NSDecimalNumber.RoundingMode.bankers, scale: 2, raiseOnExactness: true, raiseOnOverflow: true, raiseOnUnderflow: true, raiseOnDivideByZero: true)
    // Format the date string
    var formatter: DateFormatter = {
        let fmtr = DateFormatter()
        let myLocale = Locale(identifier: "bg_BG")
        fmtr.dateStyle = .medium
        fmtr.locale = myLocale
        return fmtr
    }()
    
//    var accountToShow: (transaction: Transaction, runningTotal: NSDecimalNumber) {
//        let account123 = AccountDataSource.createTransaction(transactionTest)
//        return account123
//    }
    
    @IBOutlet var theDate: UILabel! {
        didSet {
        //    theDate.text = formatter.string(from: AccountDataSource.createTransaction())
        }
    }
    
    @IBOutlet var theDescription: UILabel! {
        didSet {
            theDescription.text = "hi"
        }
    }
    
    @IBOutlet var theAmount: UILabel!{
        didSet {
            theAmount.text = transactionTest.amount.rounding(accordingToBehavior: behavior).description
        }
    }
    @IBOutlet var theRunningTotal: UILabel! {
        didSet {
            
        }
    }
    
    
    
}
