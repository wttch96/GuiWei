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
    var remark: String
    
    init(name: String, color: String? = nil, remark: String = "") {
        self.name = name
        self.color = color
        self.remark = remark
    }
    
}
