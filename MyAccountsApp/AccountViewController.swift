//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class AccountViewController: UITableViewController, TransactionCreationViewControllerDelegate  {
    var dataSource = AccountDataSource(account: AccountStore().storedAccount)
    func returnTheTransaction() {
    }
    // creates a transaction in the transaction creation view controller, adds it the the datasource and then dismisses it
    func transactionCreationViewController(_ vc: TransactionCreationViewController, didCreateTransaction transaction: Transaction) {
        dataSource.account.addATransaction(withTransaction: transaction)
        _ = navigationController?.popViewController(animated: true)
        
        print(dataSource.account.currentBalance.description)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.dataSource = dataSource
        accountTotalLabel.title = "$\(dataSource.account.currentBalance.description)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(dataSource.account.currentBalance.description)
        
        tableView.reloadData()
        accountTotalLabel.title = "$\(dataSource.account.currentBalance.description)"
    }
    
    @IBOutlet var accountTotalLabel: UIBarButtonItem!
    @IBAction func makeNewTransaction(_ sender: UIBarButtonItem) {}
    @IBAction func removeATransaction(_ sender: UIBarButtonItem) {
        // removes the transaction fitting the description withtransaction
        dataSource.account.removeATransaction(withTransaction: self.dataSource.account.entries[self.dataSource.account.entries.count - 1])
        print(dataSource.account.currentBalance.description)
        tableView.reloadData()
        
    }
    // Does something when the segue is hit
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "createTransaction":
            print("howdy there!")
            let controller = segue.destination as! TransactionCreationViewController
            controller.delegate = self
        default:
            fatalError("This shouldn't happen")
        }
        
    }

    
}
