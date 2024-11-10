//
//  Item.swift
//  swiftdataUI
//
//  Created by Henrik Thomasson on 2024-11-09.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
