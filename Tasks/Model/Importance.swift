//
//  Importance.swift
//  Tasks
//
//  Created by Семен Никулин on 05.05.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation

enum Importance: Int, CustomStringConvertible {
    case low
    case normal
    case high
    
    var description: String {
        switch self {
        case .low:
            return NSLocalizedString("Low", comment: "")
        case .normal:
            return NSLocalizedString("Normal", comment: "")
        case .high:
            return NSLocalizedString("High", comment: "")
        }
    }
    
    static var source: [Importance] {
        return [.low, .normal, .high]
    }
    
    var order: Int {
        switch self {
        case .low:
            return 0
        case .normal:
            return 1
        case .high:
            return 2
        }
    }
}
