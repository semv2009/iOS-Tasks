//
//  CreateTaskViewModel.swift
//  Tasks
//
//  Created by Семен Никулин on 10.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

class CreateTaskViewModel {
    private let createTaskUseCase: SaveTaskUseCase
    private let navigator: CreateTaskNavigator
    
    init(createTaskUseCase: SaveTaskUseCase, navigator: CreateTaskNavigator) {
        self.createTaskUseCase = createTaskUseCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let importanceText = input.importance
            .map { $0.description }
        let dateText = input.date
            .map { $0.dateString }
        let solved = input.solved
            .map { $0 == 0 ? false : true }
        
        let titleAndDetails = Driver.combineLatest(input.title, input.importanceString) {
            $0
        }
        
        let activityIndicator = ActivityIndicator()
        
        let canSave = Driver.combineLatest(titleAndDetails, activityIndicator.asDriver()) {
            return !$0.0.isEmpty && !$0.1.isEmpty && !$1
        }
        
        let saveProperty = Driver.combineLatest(input.title, input.details, input.importanceString , input.dateString, solved) {
            $0
        }
        let save = input.saveTrigger.withLatestFrom(saveProperty)
            .map { (title, details, importance, date, solved) in
                Task(uid: UUID().uuidString,
                     title: title,
                     isExecute: solved,
                     content: details,
                     createDate: date.calculatedDate,
                     importance: importance)
            }
            .flatMapLatest { [unowned self] in
                self.createTaskUseCase.save(task: $0)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }
            .do(onNext: navigator.toTasks)
        
        let dismiss = input.cancelTrigger
            .do(onNext: navigator.toTasks)
        
        return Output(save: save, dismiss: dismiss, saveEnabled: canSave, importanceText: importanceText, dateText: dateText)
    }
}

extension CreateTaskViewModel {
    struct Input {
        let cancelTrigger: Driver<Void>
        let saveTrigger: Driver<Void>
        let title: Driver<String>
        let details: Driver<String>
        let importance: Observable<Importance>
        let date: Observable<Date>
        let solved: Driver<Int>
        let importanceString: Driver<String>
        let dateString: Driver<String>
    }
    
    struct Output {
        let save: Driver<Void>
        let dismiss: Driver<Void>
        let saveEnabled: Driver<Bool>
        let importanceText: Observable<String>
        let dateText: Observable<String>
    }
}
