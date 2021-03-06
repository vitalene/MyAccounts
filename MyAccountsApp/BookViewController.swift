//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class BookViewController: UITableViewController, BookCreationViewControllerDelegate  {
    
    var dataSource: BookDataSource! = nil
    
    
    func bookCreationViewController(_ vc: BookCreationViewController, didCreateBook book: Book) {
        dataSource.bookStore.add(book: book)
        _ = navigationController?.popViewController(animated: true)
        
        print("\n\n\n\n\(dataSource.books.count)")
    }

    @IBAction func removeABook(_ sender: AnyObject) {
        if dataSource.books.count > 0 {
            dataSource.bookStore.remove(bookAt: dataSource.books.count - 1)
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
        tableView.delegate = self
        self.dataSource.viewController = self
        
        // Changes the color of the navigation bar
        navigationController?.navigationBar.barTintColor = UIColor(red:0.23, green:0.72, blue:0.58, alpha:1.0)
        navigationController?.navigationBar.tintColor = UIColor.white
        
//        navigationController?.navigationBar.barTintColor = UIColor(red:0.64, green:0.26, blue:0.00, alpha:1.0)
        
//        for family: String in UIFont.familyNames
//        {
//            print("\(family)")
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }
//        

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


    

    
    
    
}



