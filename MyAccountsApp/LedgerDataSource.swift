//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts

internal class LedgerDataSource: NSObject, UITableViewDataSource {
    var ledger: Ledger
    
    init(ledger: Ledger) {
        self.ledger = ledger
    }


    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    // Sets the tableView to have a data type of "TransactionCell"
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // gets a reusable transaction cell from the tableview
        let cell: AccountCell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        
        let cellAccount = ledger.accounts[indexPath.row]
        
        cell.accountTitleLabel.text = cellAccount.title
        cell.amountTextLabel.text = "$\(cellAccount.currentBalance.description)"
        
        return cell
    }





}