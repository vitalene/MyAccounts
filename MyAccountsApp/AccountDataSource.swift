//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts


internal class AccountDataSource: NSObject, UITableViewDataSource {
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    //MARK: - Account View data source
    
    // changing the number of sections to be the count of the section array
    // number of sections should be one at this point in features
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Sets up the tableview to have as many rows as the account has transactions
    // ie. "entries"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.entries.count
    }
    
    // Sets the tableView to have a data type of "TransactionCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // gets a reusable transaction cell from the tableview
        let cell: TransactionCell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        // create the transaction for the row in the index path
        let transaction = account.entriesWithRunningTotals()[indexPath.row]
        
        
        // update the text labels in the table view's row
        cell.dateLabel.text = TransactionCell.dateFormatter.string(from: transaction.transaction.date)
        cell.descriptionLabel.text = transaction.transaction.userProvidedDescription
        cell.amountLabel.text = "$\(transaction.transaction.amount.rounding(accordingToBehavior: TransactionCell.numberHandler).description)"
        let cellRunningTotal = transaction.runningTotal.description
        cell.runningTotalLabel.text = "$\(cellRunningTotal)"
        return cell
    }
    
    
    
    
    
}



