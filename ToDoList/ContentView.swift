//
//  ContentView.swift
//  ToDoList
//
//  Created by scholar on 5/19/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    var toDoItems: FetchedResults<ToDo>
    @State private var showNewTask = false
    
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)
                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    
    var body: some View {
        VStack{
            HStack{
                Text("To Do List")
                    .font(.system(size: 40))
                    .underline()
            }
                .padding()
            Button(action: {
                self.showNewTask = true
            }) {
            Text("+")
            }
            Spacer()
            List {
                ForEach (toDoItems){ toDoItem in
                    if toDoItem.isImportant == true{
                        Text("‼️" + (toDoItem.title ?? "No Title"))
                    } else {
                        Text(toDoItem.title ?? "No Title")
                    }
                }
                .onDelete(perform: deleteTask)
            }.listStyle(.plain)
        }
        if showNewTask {
                NewToDoView(title: "", isImportant: false, showNewTask: $showNewTask)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
