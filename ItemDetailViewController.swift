//
//  ItemDetailViewController.swift
//  Checked
//
//  Created by Guti on 1/29/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

//import Foundation
import UIKit

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    
    // MARK: - Variables
    weak var delegate: ItemDetailViewControllerDelegate?
    // Variable to check if the item is to be edited
    var itemToEdit: ChecklistItem?
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    // MARK: - Actions
    
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(controller: self)
    }
    
    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewController(controller: self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewController(controller: self, didFinishAdding: item)
        }
    }
    
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
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
protocol ItemDetailViewControllerDelegate: class {
    
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}
