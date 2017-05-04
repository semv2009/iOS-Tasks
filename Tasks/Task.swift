//
//  Task.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation

public enum Importance: String {
    case low = "Low"
    case medium = "Medium"
    case hight = "Hight"
}

public struct Task {
    public let uid: String
    public let title: String
    public let isExecute: Bool
    public let content: String?
    public let createDate: Date?
    public let importance: Int
    
    public init(uid: String,
                title: String,
                isExecute: Bool,
                content: String?,
                createDate: Date?,
                importance: Int) {
        self.uid = uid
        self.title = title
        self.isExecute = isExecute
        self.content = content
        self.createDate = createDate
        self.importance = importance
    }
    
    public init() {
        self.uid = UUID().uuidString
        self.title = ""
        self.isExecute = false
        self.content = ""
        self.createDate = nil
        self.importance = -1
    }
}

extension Task: Equatable {
    public static func == (lhs: Task, rhs: Task) -> Bool {
        return  lhs.uid == rhs.uid &&
                lhs.title == rhs.title &&
                lhs.isExecute == rhs.isExecute &&
                lhs.content == rhs.content &&
                lhs.createDate == rhs.createDate &&
                lhs.importance == rhs.importance
    }
}

