//
//  CreateTaskNavigator.swift
//  Tasks
//
//  Created by Семен Никулин on 10.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol CreateTaskNavigator {
    func toTasks()
}

final class DefaultCreatTaskNavigator: CreateTaskNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toTasks() {
        navigationController.dismiss(animated: true)
    }
}
