//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class AccountViewController: UITableViewController {
    var dataSource = AccountDataSource(account: AccountStore().storedAccount)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        accountTotalLabel.title = AccountStore().storedAccount.currentBalance.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print(tableView.dataSource)
        print(tableView.numberOfRows(inSection: 0))
    }
    
    @IBOutlet var accountTotalLabel: UIBarButtonItem!
    
    
    
    
}
