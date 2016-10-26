//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts

internal class BookDataSource: NSObject, UITableViewDataSource {
    internal weak var viewController: UIViewController?
    var bookStore: AppDataStore
    var books: [Book] {
        get {
        return bookStore.storedBooks
        }
        set(newValue) {
            bookStore.storedBooks = newValue
            
        }
    }
    
    init(bookStore: AppDataStore) {
        self.bookStore = bookStore
    }
    
    func performSegue(withIdentifier identifier: String,
                      sender: Any?) {
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    
    // Sets the tableView to have a data type of "TransactionCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // gets a reusable transaction cell from the tableview
        let cell: BookCell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        
        cell.BookNameLabel.text = books[indexPath.row].bookTitle
//        cell.BookNameLabel.font = UIFont(name: "NotoEmoji", size: 25)
//        
//        if (indexPath.row % 2) == 0 {
//            cell.backgroundColor = UIColor(red:0.23, green:0.72, blue:0.58, alpha:0.7)
//            
//        } else {
//            cell.backgroundColor =
//                UIColor(red:0.94, green:0.94, blue:0.96, alpha:0.7)
//        }
//        
        
        return cell
    }
    
    //MARK: NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.books, forKey: "BookArray")
        
    }
    
    
    public func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCellEditingStyle,
                          forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let book = books[(indexPath as NSIndexPath).row]
            
            
            let title = "Delete \(book.bookTitle)?"
            let message = "Are you sure you want to delete this account?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                self.books.remove(at: indexPath.row)
                                                
                                                // Also remove that row from the table view with an animation
                                                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            self.viewController!.present(ac, animated: true, completion: nil)
        }
    }

    
    //
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //
    //    if segue.identifier == "next" {
    //        // On this View Controller make an Index property, like var index
    //        let nextVC = segue.destinationViewController as! UIViewController
    //        nextVC.index = sender as! Int
    //}
    
    
    
}
