//
//  AddItemViewController.swift
//  Checked
//
//  Created by Guti on 1/29/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

//import Foundation
import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    
    // MARK: - Variables
    weak var delegate: AddItemViewControllerDelegate?
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    // MARK: - Actions
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(controller: self)
    }
    
    @IBAction func done() {

        let item = ChecklistItem()
        item.description = textField.text!
        item.checked = false
        delegate?.addItemViewController(controller: self, didFinishAdding: item)
    }
    
    
    // MARK: View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    
    // MARK: - Table View Delegate
        
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    // MARK: - Text Field Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // the range is the location where the replacement string is to be
        // added to the original string value
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton.isEnabled = (newText.length > 0) // :String - characters.count
        
        return true
    }
}


// MARK: - Protocols
protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}
