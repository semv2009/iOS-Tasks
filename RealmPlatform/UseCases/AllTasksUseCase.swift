//
//  AllTasksUseCase.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import Realm
import RealmSwift

final class AllTasksUseCase: Domain.AllTasksUseCase {
    private let repository: AbstractRepository<Task>
    
    init(repository: AbstractRepository<Task>) {
        self.repository = repository
    }
    
    func tasks() -> Observable<[Task]> {
        return repository.queryAll()
    }
}
