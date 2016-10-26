//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts
class LedgerViewController: UITableViewController, AccountCreationViewControllerDelegate {
    
    var dataSource = LedgerDataSource(ledger: Ledger(with: []))
    
    
    
    func accountCreationViewController(_ vc: AccountCreationViewController, didCreateAccount account: Account) {
        dataSource.ledger.accounts.append(account)
        
        _ = navigationController?.popViewController(animated: true)
        tableView.reloadData()

        print("\n\n\n\n\n\n\n\(dataSource.ledger.accounts.count)")
        
        
    }
    
    
    
    
    //    var dataSource = BookDataSource(books: AppDataStore().storedBooks)
    override func viewDidLoad() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        dataSource.viewController = self
        super.viewDidLoad()
        tableView.reloadData()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    // Does something when the segue is hit
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "createAccount":
            print("❤️❤️❤️")
            if let row = (tableView.indexPathForSelectedRow as IndexPath?)?.row {
                let accountRow = dataSource.ledger.accounts[row]
                let controller = segue.destination as! AccountViewController
                controller.dataSource.account = accountRow
            }
        case "createNewAccount":
            print("💜💜💜")
            
            let controller = segue.destination as! AccountCreationViewController
            controller.delegate = self
            
            
        default:
            fatalError("This shouldn't happen")
        }
        
    }
    @IBAction func removeAnAccount(_ sender: AnyObject) {
        if dataSource.ledger.accounts.count > 0 {
            dataSource.ledger.accounts.remove(at: (dataSource.ledger.accounts.count - 1))
            tableView.reloadData()
        }
    }
    
    
    @IBAction func toggleEditingMode(_ sender: UIBarButtonItem) {
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.title = "edit"
            
            // Turn off editing mode
            setEditing(false, animated: true)
        }
        else {
            // Change text of button to inform user of state
                sender.title = "done"
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true 
    }
    


    
    // MARK: - Table view data source
    
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
