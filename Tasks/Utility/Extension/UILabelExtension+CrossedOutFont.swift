//
//  UILabelExtension+CrossedOutFont.swift
//  Tasks
//
//  Created by svn on 04/05/2017.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setCrossOutText(_ text: String?) {
        let attributeString =  NSMutableAttributedString(string: text ?? "")
        attributeString.addAttributes([NSStrikethroughStyleAttributeName: 2, NSBaselineOffsetAttributeName: 0.0], range: NSMakeRange(0, attributeString.length))
        self.attributedText = attributeString
    }
}

