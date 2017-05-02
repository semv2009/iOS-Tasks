//
//  TasksViewModel.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

class TasksViewModel: ViewModelType {
    private let useCase: AllTasksUseCase
    private let navigator: TasksNavigator
    
    init(useCase: AllTasksUseCase, navigator: TasksNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let tasks = input.trigger.flatMapLatest {
            self.useCase.tasks()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriver(onErrorJustReturn: [])
        }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        let selectTask = input.selection
            .withLatestFrom(tasks) { (indexPath, posts) -> Task in
                posts[indexPath.row]
            }
            .do(onNext: navigator.toTask)
        let createTask = input.createTaskTrigger
            .do(onNext: navigator.toCreateTask)
        
        return Output(fetching: fetching,
                      tasks: tasks,
                      createTask: createTask,
                      selectTask: selectTask,
                      error: errors)
    }
}

extension TasksViewModel {
    struct Input {
        let trigger: Driver<Void>
        let createTaskTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let tasks: Driver<[Task]>
        let createTask: Driver<Void>
        let selectTask: Driver<Task>
        let error: Driver<Error>
    }
}
