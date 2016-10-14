//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class AccountViewController: UITableViewController {
    
//    let section = ["Red", "Yellow", "Green"]
//    let items = [["🍉", "🍒", "🌶"], ["🍋", "🍌", "🌽"], ["🍏", "🍈", "🍐"]]
    
    let accountDataSource: AccountDataSource! = nil
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = accountDataSource
        //        self.tableView.register(TransactionCell.self, forCellReuseIdentifier: "UITableViewCell")
        
    }
    
    
    

    

    
}

