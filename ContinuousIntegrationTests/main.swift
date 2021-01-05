//
//  main.swift
//  OpenWeather
//
//  Created by Ricardo Maqueda Martinez on 29/05/2019.
//  Copyright © 2019 Ricardo Maqueda Martinez. All rights reserved.
//

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
