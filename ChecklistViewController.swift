//
//  ViewController.swift
//  Checked
//
//  Created by Guti on 1/21/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//


/*
 * Let's you organize to-do items into tlists and then check of these items once
 * you're done with them
 */
import UIKit

class ChecklistViewController: UITableViewController {

    
    // MARK: - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Data Source
    
    // Return the number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 19
    }
    
    // how to display each row of the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row == 1 {
            label.text = "Bruh my teeth"
        } else if indexPath.row == 4 {
            label.text = "Eat ice cream"
        }
        
        return cell
    }
    
    
    // MARK: - Delegate
    
    // Deselect the row after it becomes selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // toggle the checkmark
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else { // check for checkmar??
                cell.accessoryType = .none
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

