//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


import UIKit
import MyAccounts
class BookViewController: UITableViewController {
    
    var dataSource = BookDataSource(books: AppDataStore().storedBooks)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        
    }
    
    
}
