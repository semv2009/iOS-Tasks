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

final class TasksViewModel: ViewModelType {
    struct Input {
        let trigger: Driver<Void>
        let createPostTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Driver<Bool>
        let tasks: Driver<[Task]>
        let createPost: Driver<Void>
        let selectedPost: Driver<Task>
        let error: Driver<Error>
    }
    
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
            return self.useCase.tasks()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriver(onErrorJustReturn: [])
        }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        let selectedPost = input.selection
            .withLatestFrom(tasks) { (indexPath, posts) -> Task in
                return posts[indexPath.row]
            }
            .do(onNext: navigator.toTask)
        let createPost = input.createPostTrigger
            .do(onNext: navigator.toCreateTask)
        
        return Output(fetching: fetching,
                      tasks: tasks,
                      createPost: createPost,
                      selectedPost: selectedPost,
                      error: errors)
    }
}
