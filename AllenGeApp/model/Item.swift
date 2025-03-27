//
//  Item.swift
//  AllenGeApp
//
//  Created by mt on 2025/3/20.
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
