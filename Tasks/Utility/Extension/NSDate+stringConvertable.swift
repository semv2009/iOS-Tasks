//
//  NSDate+stringConvertable.swift
//  Tasks
//
//  Created by Семен Никулин on 02.05.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation

extension Date {
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm dd-MM-yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
