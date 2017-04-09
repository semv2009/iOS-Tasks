//
//  Application.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//
import Foundation
import Domain
import RealmPlatform

final class Application {
    static let shared = Application()
    
    private let realmUseCaseProvider: Domain.UseCaseProvider
    
    private init() {
        self.realmUseCaseProvider = RealmPlatform.UseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow) {
        let navigationController = UINavigationController()
        let rmNavigator = DefaultTasksNavigator(services: realmUseCaseProvider,
                                                navigationController: navigationController)
        window.rootViewController = navigationController
        rmNavigator.toTasks()
    }
}
