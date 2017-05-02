//
//  String+DateConvertable.swift
//  Tasks
//
//  Created by Семен Никулин on 02.05.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation

extension String {
    var calculatedDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm dd-MM-yyyy"
        return dateFormatter.date(from: self) ?? Date()
    }
}
