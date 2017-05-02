//
//  Functions.swift
//  Tasks
//
//  Created by Семен Никулин on 02.05.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation

public func make<T>(_ object: T, _ initializer: (T) -> Void) -> T {
    initializer(object)
    return object
}
