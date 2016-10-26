//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts

public class LedgerDataSource: NSObject, UITableViewDataSource {
    public var ledger: Ledger
    internal weak var viewController: UIViewController?
    init(ledger: Ledger) {
        self.ledger = ledger
    }
    
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ledger.accounts.count
    }
    
    
    // Sets the tableView to have a data type of "TransactionCell"
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // gets a reusable transaction cell from the tableview
        let cell: AccountCell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        
        let cellAccount = ledger.accounts[indexPath.row]
        
        cell.accountTitleLabel.text = cellAccount.title
        cell.amountTextLabel.text = "$\(cellAccount.currentBalance.description)"
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let account = ledger.accounts[(indexPath as NSIndexPath).row]
            
            
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
                                                self.ledger.accounts.remove(at: indexPath.row)
                                                
                                                // Also remove that row from the table view with an animation
                                                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            self.viewController!.present(ac, animated: true, completion: nil)
        }
    }
    
    
    
}
