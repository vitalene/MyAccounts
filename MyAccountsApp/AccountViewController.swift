//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class AccountViewController: UITableViewController {
    var dataSource = AccountDataSource(account: AccountStore().storedAccount)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        accountTotalLabel.title = "$\(dataSource.account.currentBalance.description)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dataSource.account.addATransaction(withTransaction: Transaction(on: Date(), description: "Lemonade money", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar))
        tableView.reloadData()
        accountTotalLabel.title = "$\(dataSource.account.currentBalance.description)"
        }
    
    @IBOutlet var accountTotalLabel: UIBarButtonItem!
    
    
    
    
}
