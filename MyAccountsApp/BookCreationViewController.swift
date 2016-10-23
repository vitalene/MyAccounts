//  Copyright © 2016 Neil Vitale. All rights reserved.

import UIKit
import MyAccounts

protocol BookCreationViewControllerDelegate {
    func bookCreationViewController(_ vc: BookCreationViewController, didCreateBook account: Book)
}



class BookCreationViewController: UIViewController {
    
    var bookToSend = Book(withLedger: Ledger(with: []), title: "")
    var delegate:BookCreationViewControllerDelegate?
    
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    }
    
    @IBOutlet var bookTitleTextBox: UITextField!
    
    @IBAction func saveButton(_ sender: AnyObject) {
        self.bookToSend.bookTitle = bookTitleTextBox.text!
        
        delegate?.bookCreationViewController(self, didCreateBook: bookToSend)
        
        
    }
    
    
}
