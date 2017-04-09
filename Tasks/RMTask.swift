//
//  RMTask.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import QueryKit
import RealmSwift
import Realm
import Domain

final class RMTask: Object {
    dynamic var uid: String = ""
    dynamic var title: String = ""
    dynamic var isExecute: Bool = false
    dynamic var content: String? = nil
    dynamic var createDate: Date? = nil
    dynamic var importance: String? = nil
    
    override class func primaryKey() -> String? {
        return "uid"
    }
}

extension RMTask: DomainConvertibleType {
    func asDomain() -> Task {
        return Task(uid: uid,
                    title: title,
                    isExecute: isExecute,
                    content: content,
                    createDate: createDate,
                    importance: importance)
    }
}

extension Task: RealmRepresentable {
    func asRealm() -> RMTask {
        return RMTask.build { object in
            object.uid = uid
            object.title = title
            object.isExecute = isExecute
            object.content = content
            object.createDate = createDate
            object.importance = importance
        }
    }
}
