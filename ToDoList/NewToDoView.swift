//
//  NewToDoView.swift
//  ToDoList
//
//  Created by scholar on 5/20/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    @State var title: String
    @State var isImportant: Bool
    @Binding var showNewTask : Bool
    var body: some View {
        VStack{
            Text("Add a new task")
                .font(.largeTitle)
                .foregroundColor(.green)
                .padding()
            TextField("Enter the task description", text: $title)
                .padding()
                .font(.title)
                .background(.yellow)
                .cornerRadius(50)
                .padding()
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
                    .padding()
                    .foregroundColor(.gray)
                    .font(.title2)
            }
                .padding()
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }){
                Text("Add")
                    .padding()
            }
        }
    }
    private func addTask(title: String, isImportant: Bool = false) {
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
        }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "", isImportant: false, showNewTask: .constant(true))
    }
}
