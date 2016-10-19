//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

protocol TransactionCreationViewControllerDelegate {
    func transactionCreationViewController(_ vc: TransactionCreationViewController, didCreateTransaction transaction: Transaction)
}



class TransactionCreationViewController: UIViewController {
    
    var transactionToSend = Transaction(on: Date(), description: "", amount: 0.00, lastAccountTotal: 0.00, type: .credit , currencyType: .dollar)
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.transactionCreationViewController(self, didCreateTransaction: transactionToSend)

        
    }
    
    
    @IBOutlet var amountTextBox: UITextField!
    
    @IBOutlet var descriptionTextBox: UITextField!
    
    @IBOutlet var dateAndTimePicker: UIDatePicker!
    var delegate:TransactionCreationViewControllerDelegate?
    
    
    @IBOutlet var transactionTypeSwitch: UISwitch!
    
    
    @IBAction func saveButton(_ sender: AnyObject) {
        self.transactionToSend.amount = NSDecimalNumber(string: amountTextBox.text)
        self.transactionToSend.addADescription(with: descriptionTextBox.text!)
        self.transactionToSend.addADate(with: dateAndTimePicker.date)
        if transactionTypeSwitch.isOn {
            self.transactionToSend.transactionType = .debit
        } else {
            self.transactionToSend.transactionType = .credit
        }
     
    
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
}
