//
//  ChecklistItem.swift
//  Checked
//
//  Created by Guti on 1/26/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import Foundation

// Make a new to do item
class ChecklistItem {
    
    
    // MARK: - Variables
    
    var description = ""
    var checked = false
    
    
    // MARK: - Methods
    
    func toggleCheck() {
        checked = !checked
    }
}
