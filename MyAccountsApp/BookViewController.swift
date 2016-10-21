//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation


import UIKit
import MyAccounts
class BookViewController: UITableViewController {
    
    var dataSource = BookDataSource(books: AppDataStore().storedBooks)
    
    /*  var currentlySelectedPath: [String:Int] = ["Book":Int, "Ledger":Int, "Account":Int, "Transaction":Int]
     Create a dictionary that will hold the current path for the currently viewed view controller
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        
    }
    
    
    // Does something when the segue is hit
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "createLedger":
            print("howdy there!")
            if let row = (tableView.indexPathForSelectedRow as IndexPath?)?.row {
                let bookRow = dataSource.books[row]
                let controller = segue.destination as! LedgerViewController
                controller.dataSource.ledger = bookRow.aLedger
                
            }
        default:
            fatalError("This shouldn't happen")
        }
        
    }
    
    
    
    
    
}



