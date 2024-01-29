//
//  Item.swift
//  SwiftUIPie
//
//  Created by David Li on 2024-01-28.
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
