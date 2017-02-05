//
//  ChecklistItem.swift
//  Checked
//
//  Created by Guti on 1/26/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import Foundation

// Make a new to do item
class ChecklistItem: NSObject { // Equatable
    
    
    // MARK: - Variables
    
    var text = ""
    var checked = false
    
    
    // MARK: - Methods
    
    func toggleCheck() {
        checked = !checked
    }
    
//    // MARK: - Equatable
//    
//    static func == (left: ChecklistItem, right: ChecklistItem) -> Bool {
//        return left.description == right.description
//    }
}
