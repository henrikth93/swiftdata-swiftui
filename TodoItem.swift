//
//  TodoItem.swift
//  swiftdataUI
//
//  Created by Henrik Thomasson on 2024-11-09.
//
import SwiftData

@Model
class TodoItem {
    var title: String
    var isCompleted: Bool = false
    var sortOrder: Int = 0
    
    init(title: String) {
        self.title = title
    }
}
