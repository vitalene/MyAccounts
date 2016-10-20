//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts

internal class BookDataSource: NSObject, UITableViewDataSource {
    var books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    // Sets the tableView to have a data type of "TransactionCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // gets a reusable transaction cell from the tableview
        let cell: BookCell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        
        //let cellBook = books[indexPath.row]
        
        cell.BookNameLabel.text = books[indexPath.row].bookTitle
        
        
        return cell
    }
    
    
    
    
    
}
