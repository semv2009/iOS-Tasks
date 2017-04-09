//
//  UseCaseProvider.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import Domain
import Realm
import RealmSwift

public final class UseCaseProvider: Domain.UseCaseProvider {
    private let configuration: Realm.Configuration
    
    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }
    
    public func getAllTasksUseCase() -> Domain.AllTasksUseCase {
        let repository = Repository<Task>(configuration: configuration)
        return AllTasksUseCase(repository: repository)
    }
    
    public func getCreateTaskUseCase() -> Domain.SaveTaskUseCase {
        let repository = Repository<Task>(configuration: configuration)
        return SavePostUseCase(repository: repository)
    }
    
}
