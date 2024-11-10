//
//  ContentView.swift
//  swiftdataUI
//
//  Created by Henrik Thomasson on 2024-11-09. MYH
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TodoItem.sortOrder) private var todoItems: [TodoItem]
    
    @State private var newTodoTitle: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Ny todo...", text: $newTodoTitle) .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: addTodoItem) {
                        Image(systemName: "plus")
                    }
                    .disabled(newTodoTitle.isEmpty)
                }
                .padding()
                
                
                List {
                    ForEach(todoItems) { item in
                        HStack {
                            Text(item.title)
                                .strikethrough(item.isCompleted)
                            Spacer()
                            Button(action: {
                                toggleCompletion(for: item)
                            }) {
                                Image(systemName: item.isCompleted ? "checkmark.ccircle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteTodoItems)
                }
            }
            .navigationTitle("Att göra")
        }
    }
    
    private func addTodoItem() {
        let newItem = TodoItem(title: newTodoTitle)
        modelContext.insert(newItem)
        newTodoTitle = ""
    }
    
    private func toggleCompletion(for item: TodoItem) {
        item.isCompleted.toggle()
        item.sortOrder = item.isCompleted ? 1 : 0
    }
    
    private func deleteTodoItems(at offsets: IndexSet) {
        for index in offsets {
            let item = todoItems[index]
            modelContext.delete(item)
        }
    }
}
