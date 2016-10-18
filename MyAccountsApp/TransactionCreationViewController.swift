//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

protocol TransactionCreationViewControllerDelegate {
    func transactionCreationViewController(_ vc: TransactionCreationViewController, didCreateTransaction transaction: Transaction)
}

class TransactionCreationViewController: UIViewController {
    @IBOutlet var amountTextBox: UITextField!
    @IBOutlet var descriptionTextBox: UITextField!
    
    @IBOutlet var dateAndTimePicker: UIDatePicker!
    var delegate:TransactionCreationViewControllerDelegate?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        delegate?.transactionCreationViewController(self, didCreateTransaction: Transaction(on: Date(), description: "hi", amount: 8.00, lastAccountTotal: 50.00, type: .credit, currencyType: .dollar))
        
        
            
            //self, didCreateTransaction: Transaction(on: Date(), description: "hi", amount: 14.0, lastAccountTotal: 22.0, type: .credit, currencyType: .dollar)
    }


    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
