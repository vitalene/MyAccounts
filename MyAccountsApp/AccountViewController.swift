//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

class AccountViewController: UITableViewController {
    
    let section = ["Red", "Yellow", "Green"]
    let items = [["🍉", "🍒", "🌶"], ["🍋", "🍌", "🌽"], ["🍏", "🍈", "🍐"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tableView.register(TransactionCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        
    }
    
    // Sets up the tableview to only have one row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // changing the number of sections to be the count of the section array
    override func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    // Sets the tableView to have a data type of "TransactionCell" 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "TransactionCell")! as UITableViewCell
        
        return cell
    }
    
    // Sets up the table view's TITLE!
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    // sets up the view for the header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.magenta
        return vw
    }
    
    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    
}

