//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by scholar on 5/19/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)        }
    }
}
