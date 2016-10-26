//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

protocol AccountCreationViewControllerDelegate {
    func accountCreationViewController(_ vc: AccountCreationViewController, didCreateAccount account: Account)
}



class AccountCreationViewController: UIViewController {
    
    var accountToSend = Account(entries: [], title: "Default Account Title", initialBalance: 0.00, category: .asset(isEquity: false))
    var delegate:AccountCreationViewControllerDelegate?

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBOutlet var initialBalanceTextBox: UITextField!
    
    @IBOutlet var accountTitleTextBox: UITextField!
  
    @IBAction func saveButton(_ sender: AnyObject) {
        self.accountToSend.title = accountTitleTextBox.text!
        self.accountToSend.initialBalance = NSDecimalNumber(string: initialBalanceTextBox.text)
        self.accountToSend.currentBalance = self.accountToSend.initialBalance
        
        delegate?.accountCreationViewController(self, didCreateAccount: accountToSend)

        
    }
    
    
}
