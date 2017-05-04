//
//  Importance.swift
//  Tasks
//
//  Created by Семен Никулин on 05.05.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation

enum Importance: String, CustomStringConvertible {
    case low = "Low"
    case normal = "Normal"
    case hight = "Hight"
    
    var description: String {
        return self.rawValue
    }
    
    static var source: [Importance] {
        return [.low, .normal, .hight]
    }
}
