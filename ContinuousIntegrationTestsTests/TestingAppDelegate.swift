//
//  TestingAppDelegate.swift
//  OpenWeatherTests
//
//  Created by Ricardo Maqueda Martinez on 29/05/2019.
//  Copyright © 2019 Ricardo Maqueda Martinez. All rights reserved.
//

import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UIViewController()
        return true
    }
}
