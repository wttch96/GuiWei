//
//  Tag.swift
//  GuiWei
//
//  Created by Wttch on 2026/5/1.
//

import Foundation
import SwiftData


@Model
class Tag: Hashable {

    var name: String
    var color: String?
    
    init(name: String, color: String? = nil) {
        self.name = name
        self.color = color
    }
    
}
