//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class AccountViewController: UITableViewController {
    var dataSource = AccountDataSource(account: AccountStore().storedAccount)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        //let numberOfRows = tableView.numberOfRows(inSection: 1)
        //accountTotalLabel.title = tableView.dequeueReusableCell(withIdentifier: "T
        accountTotalLabel.title = "$\(AccountStore().storedAccount.currentBalance.description)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBOutlet var accountTotalLabel: UIBarButtonItem!
    
    
    
    
}
