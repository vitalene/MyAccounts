//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts


internal class AccountDataSource: NSObject, UITableViewDataSource {
    var account: Account
    internal weak var viewController: UIViewController?
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
        
        if (indexPath.row % 2) == 0 {
            cell.backgroundColor = UIColor(red:0.23, green:0.72, blue:0.58, alpha: 0.7)
            cell.descriptionLabel.textColor = UIColor.white
            cell.dateLabel.textColor = UIColor.white
            cell.amountLabel.textColor = UIColor.white
            cell.runningTotalLabel.textColor = UIColor.white

        } else {
            cell.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1.0)
//            cell.descriptionLabel.textColor = UIColor.black
//            cell.dateLabel.textColor = UIColor.black
//            cell.amountLabel.textColor = UIColor.black
//            cell.runningTotalLabel.textColor = UIColor.black
            cell.descriptionLabel.textColor = UIColor(red:0.23, green:0.72, blue:0.58, alpha: 1)
            cell.dateLabel.textColor = UIColor(red:0.23, green:0.72, blue:0.58, alpha: 1)
            cell.amountLabel.textColor = UIColor(red:0.23, green:0.72, blue:0.58, alpha: 1)
            cell.runningTotalLabel.textColor = UIColor(red:0.23, green:0.72, blue:0.58, alpha: 1)


        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCellEditingStyle,
                          forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let transaction = account.entries[(indexPath as NSIndexPath).row]
            
            
            let title = "Delete \(account.title)?"
            let message = "Are you sure you want to delete this account?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                self.account.entries.remove(at: indexPath.row)
                                                
                                                // Also remove that row from the table view with an animation
                                                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            self.viewController!.present(ac, animated: true, completion: nil)
        }
    }

    
  
    
}



