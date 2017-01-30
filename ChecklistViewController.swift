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
    
    // MARK: - Variables
    var items: [ChecklistItem]


    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let item0 = ChecklistItem()
        item0.description = "Walk the dog"
        item0.checked = false
        
        let item1 = ChecklistItem()
        item1.description = "Brush my teeth"
        item1.checked = true
        
        items.append(item0)
        items.append(item1)
        
        super.init(coder: aDecoder)
    }
    
    // MARK: - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
//    @IBAction func addItem() {
//        let newRowIndex = items.count
//        
//        let item = ChecklistItem()
//        item.description = "I am a new row"
//        item.checked = false
//        items.append(item)
//        
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        
//        tableView.insertRows(at: indexPaths, with: .automatic)
//    }
    

    // MARK: - Data Source
    
    // Return the number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    // how to display each row of the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        // Configure the cell's properties
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckStatusFor(cell, withChecklistItem: item)
        
        return cell
    }
    
    // Delete rows with "swipe-to-delete"
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
    // MARK: - Delegate
    
    // Deselect the row after it becomes selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // toggle the checkmark
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleCheck()
            configureCheckStatusFor(cell, withChecklistItem: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Helper methods
    
    // Configures the state of the cell's checkmark
    private func configureCheckStatusFor(_ cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    private func configureTextForCell(_ cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.description
    }
}

