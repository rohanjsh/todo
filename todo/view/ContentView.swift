//
//  ContentView.swift
//  todo
//
//  Created by Rohan Joshi on 07/02/24.
//

import SwiftUI


// Defines a ContentView struct that conforms to the View protocol, serving as the UI for your app.
struct ContentView: View {
    // @State is a property wrapper designed for local state management in SwiftUI, triggering the view to re-render upon changes.
    // More info: https://developer.apple.com/documentation/swiftui/state
    @State private var items: [ToDoItem] = []
    @State private var newItemName: String = ""

    var body: some View {
        // More info: https://developer.apple.com/documentation/swiftui/navigationstack
        NavigationStack {
            
            // List is used to display an ordered collection of data.
            // More info: https://developer.apple.com/documentation/swiftui/list
            List {
                
                // Section docs: https://developer.apple.com/documentation/swiftui/section
                Section(header: Text("Add New Task")) {
                    
                    // HStack docs: https://developer.apple.com/documentation/swiftui/hstack
                    HStack {
                        
                        // TextField for user input.
                        // TextField docs: https://developer.apple.com/documentation/swiftui/textfield
                        TextField("Task Name", text: $newItemName)
                        
                        // Button docs: https://developer.apple.com/documentation/swiftui/button
                        Button(action: addNewItem) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                }
                
                Section {
                    
                    // ForEach docs: https://developer.apple.com/documentation/swiftui/foreach
                    ForEach(items) { item in
                        Text(item.name)
                    }
                    // onDelete docs: https://developer.apple.com/documentation/swiftui/dynamicviewcontent/ondelete(perform:)
                    .onDelete(perform: deleteItem)
                }
            }
            // navigationTitle docs: https://developer.apple.com/documentation/swiftui/view/navigationtitle(_:)-43srq
            .navigationTitle("To-Do List")
            
            // toolbar docs: https://developer.apple.com/documentation/swiftui/view/toolbar(content:)-7vdkx
            .toolbar {
                
                //EditButton docs: https://developer.apple.com/documentation/swiftui/editbutton
                EditButton()
            }
        }
    }

    func addNewItem() {
        if !newItemName.isEmpty {
            items.append(ToDoItem(name: newItemName))
            newItemName = ""
        }
    }

    // IndexSet docs: https://developer.apple.com/documentation/foundation/indexset
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}



#Preview {
    ContentView()
}
