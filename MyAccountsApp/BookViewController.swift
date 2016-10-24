//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class BookViewController: UITableViewController, BookCreationViewControllerDelegate  {
    
    var dataSource = BookDataSource(books: AppDataStore().storedBooks)
    
    
    func bookCreationViewController(_ vc: BookCreationViewController, didCreateBook book: Book) {
        dataSource.books.append(book)
        _ = navigationController?.popViewController(animated: true)
        
        print("\n\n\n\n\(dataSource.books.count)")
    }

    @IBAction func removeABook(_ sender: AnyObject) {
        if dataSource.books.count > 0 {
            dataSource.books.remove(at: dataSource.books.count - 1)
            tableView.reloadData()
        }

    }
    
    
    
    
    /*  var currentlySelectedPath: [String:Int] = ["Book":Int, "Ledger":Int, "Account":Int, "Transaction":Int]
     Create a dictionary that will hold the current path for the currently viewed view controller
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.dataSource = dataSource

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    
    // Does something when the segue is hit
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "createLedger":
            print("🍋🍋🍋")
            if let row = (tableView.indexPathForSelectedRow as IndexPath?)?.row {
                let bookRow = dataSource.books[row]
                let controller = segue.destination as! LedgerViewController
                controller.dataSource.ledger = bookRow.aLedger
            }
        case "createNewBook":
            print("🍒🍒🍒")
            let controller = segue.destination as! BookCreationViewController
            controller.delegate = self

            
        default:
            fatalError("This shouldn't happen")
        }
        
    }
    
      
    

    

    
    
    
}



