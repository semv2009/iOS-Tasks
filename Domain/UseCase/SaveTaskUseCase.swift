//
//  SaveTaskUseCase.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import RxSwift

public protocol SaveTaskUseCase {
    func save(post: Task) -> Observable<Void>
}
