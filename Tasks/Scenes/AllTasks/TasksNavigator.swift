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
//        let navigator = DefaultCreatePostNavigator(navigationController: navigationController)
//        let viewModel = CreatePostViewModel(createPostUseCase: services.getCreatePostUseCase(),
//                                            navigator: navigator)
//        let vc = storyBoard.instantiateViewController(ofType: CreatePostViewController.self)
//        vc.viewModel = viewModel
//        let nc = UINavigationController(rootViewController: vc)
//        navigationController.present(nc, animated: true, completion: nil)
    }
    
    func toTask(_ task: Task) {
//        let vc = storyBoard.instantiateViewController(ofType: EditPostViewController.self)
//        let viewModel = EditPostViewModel(post: post, useCase: services.getCreatePostUseCase())
//        vc.viewModel = viewModel
//        navigationController.pushViewController(vc, animated: true)
    }
}