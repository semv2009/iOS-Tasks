//
//  UseCaseProvider.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
    
    func getAllTasksUseCase() -> AllTasksUseCase
    
    func getCreateTaskUseCase() -> SaveTaskUseCase
}
