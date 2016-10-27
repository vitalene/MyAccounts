//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class AccountViewController: UITableViewController, TransactionCreationViewControllerDelegate  {
    
    var dataSource = AccountDataSource(account: Account(entries: [], title: "", initialBalance: 0.00, category: .asset(isEquity: false)))
    
    //AccountDataSource(account: AccountStore().storedAccount)
    func returnTheTransaction() {
    }
    // creates a transaction in the transaction creation view controller, adds it the the datasource and then dismisses it
    func transactionCreationViewController(_ vc: TransactionCreationViewController, didCreateTransaction transaction: Transaction) {
        dataSource.account.addATransaction(withTransaction: transaction)
        _ = navigationController?.popViewController(animated: true)
        updateTotal()
        print(dataSource.account.currentBalance.description)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.dataSource = dataSource
        tableView.delegate = self
        self.dataSource.viewController = self
        updateTotal()
    }
    
    func updateTotal(shouldCallReloadData: Bool = true) {
        print("😡😡FASDFASDFASDFASDFASDFASDFASDFASDFASDFASDFASD")
        if shouldCallReloadData {
            tableView.reloadData()
        }
        print("$\(dataSource.account.currentBalance.description)")
        accountTotalLabel.title = "$\(dataSource.account.currentBalance.description)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(dataSource.account.currentBalance.description)
        
        updateTotal()
    }
    
    @IBOutlet var accountTotalLabel: UIBarButtonItem!
    @IBAction func makeNewTransaction(_ sender: UIBarButtonItem) {}
    //    @IBAction func removeATransaction(_ sender: UIBarButtonItem) {
    //        // removes the transaction fitting the description withtransaction
    //        if self.dataSource.account.entries.count > 0 {
    //            dataSource.account.removeATransaction(withTransaction: self.dataSource.account.entries[self.dataSource.account.entries.count - 1])
    //            print(dataSource.account.currentBalance.description)
    //            tableView.reloadData()
    //        }
    //    }
    
    @IBAction func toggleEditingMode(_ sender: UIBarButtonItem) {
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.title = "Edit"
            
            // Turn off editing mode
            setEditing(false, animated: true)
        }
        else {
            // Change text of button to inform user of state
            sender.title = "Done"
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
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
