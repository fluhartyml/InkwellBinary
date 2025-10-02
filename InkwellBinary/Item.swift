//
//  Item.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/2/25.
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
