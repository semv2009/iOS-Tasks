//
//  TasksNavigator.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import UIKit
import Domain

protocol TasksNavigator {
    func toCreateTask()
    func toTask(_ task: Task)
    func toTasks()
}

class DefaultTasksNavigator: TasksNavigator {
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    
    init(services: UseCaseProvider, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    
    func toTasks() {
        let tasksViewController = TasksViewController()
        tasksViewController.viewModel = TasksViewModel(useCase: services.getAllTasksUseCase(),
                                                       navigator: self)
        navigationController.pushViewController(tasksViewController, animated: true)
    }
    
    func toCreateTask() {
        let navigator = DefaultCreatTaskNavigator(navigationController: navigationController)
        let viewModel = CreateTaskViewModel(createTaskUseCase: services.getCreateTaskUseCase(),
                                            navigator: navigator)
        let creareTaskViewController = CreateTaskViewController()
        creareTaskViewController.viewModel = viewModel
        navigationController.present(UINavigationController(rootViewController: creareTaskViewController), animated: true, completion: nil)
    }
    
    func toTask(_ task: Task) {
    }
}
