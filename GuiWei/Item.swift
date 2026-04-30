//
//  Item.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
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
