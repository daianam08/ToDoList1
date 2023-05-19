//
//  ToDoItem.swift
//  ToDoList
//
//  Created by scholar on 5/19/23.
//

import Foundation

class ToDoItem: Identifiable{
    var id = UUID()
    var title : String
    var isImportant = false
    
    init(title: String, isImportant: Bool = false){
        self.title = title
        self.isImportant = isImportant
    }
}
