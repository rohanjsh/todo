//
//  TodoItem.swift
//  todo
//
//  Created by Rohan @Winkl on 07/02/24.
//

import Foundation

// Identifiable docs: https://developer.apple.com/documentation/swift/identifiable
struct ToDoItem: Identifiable {
    
    // UUID docs: https://developer.apple.com/documentation/foundation/uuid
    let id = UUID()
    var name: String
}

