//
//  PickerTextField.swift
//  Tasks
//
//  Created by Семен Никулин on 01.05.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import UIKit

class PickerTextField: UITextField {
    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
