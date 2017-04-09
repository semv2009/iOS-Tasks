//
//  AppDelegate.swift
//  Tasks
//
//  Created by Семен Никулин on 01.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        Application.shared.configureMainInterface(in: window)
        self.window = window
        self.window?.makeKeyAndVisible()
        return true
    }
}

