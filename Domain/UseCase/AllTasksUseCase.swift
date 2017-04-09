//
//  AllTasksUseCase.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import RxSwift

public protocol AllTasksUseCase {
    func posts() -> Observable<[Task]>
}
