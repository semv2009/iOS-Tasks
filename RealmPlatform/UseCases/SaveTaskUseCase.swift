//
//  SaveTaskUseCase.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import Domain
import RxSwift

final class SavePostUseCase: Domain.SaveTaskUseCase {
    private let repository: AbstractRepository<Task>
    
    init(repository: AbstractRepository<Task>) {
        self.repository = repository
    }
    
    func save(task: Task) -> Observable<Void> {
        return repository.save(entity: task)
    }
}
