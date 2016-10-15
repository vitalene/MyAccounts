//  Copyright © 2016 Neil Vitale. All rights reserved.

import Foundation
import MyAccounts


internal class AccountDataSource: NSObject, UITableViewDataSource {
    var account: Account
    init(account: Account) {
        self.account = account
    }
    //MARK: - Account View data source
    
    // changing the number of sections to be the count of the section array
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Sets up the tableview to have as many rows as needed
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.entries.count
    }
    
    // Sets the tableView to have a data type of "TransactionCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let cell: TransactionCell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        let transaction = account.entries[indexPath.row]
        
        cell.dateLabel.text = TransactionCell.dateFormatter.string(from: transaction.date)
        cell.descriptionLabel.text = transaction.userProvidedDescription
        cell.amountLabel.text = transaction.amount.rounding(accordingToBehavior: TransactionCell.numberHandler).description

        return cell
    }
    
    //    // Sets up the table view's TITLE!
    //     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "howdy" //self.section[section]
    //    }
    //    // sets up the view for the header
    //     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let vw = UIView()
    //        vw.backgroundColor = UIColor.magenta
    //        return vw
    //    }
    
    //    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //    }
    
    
    
    
}


//    var allTransactions: [(transaction: Transaction, runningTotal: NSDecimalNumber)] = []


//    func createTransaction() -> Transaction {
//
//        let now = Date()
//
//        let transaction1 = Transaction(on: now, description: "Example Description", amount: 10, lastAccountTotal: 10.0, type: .credit, currencyType: .dollar)
//
//        let thisAccount = Account(entries: [transaction1], title: "Example", initialBalance: 50.0, category: .asset(isEquity: true))
//        let transactionTuple = thisAccount.createEntryTuple(with: transaction1)
//
//        allTransactions.append(transactionTuple)
//
//        return transaction1


