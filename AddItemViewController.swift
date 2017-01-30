//
//  AddItemViewController.swift
//  Checked
//
//  Created by Guti on 1/29/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

//import Foundation
import UIKit

class AddItemViewController: UITableViewController {
    
    
    // MARK: - Actions
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Table View Delegate
        
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}
