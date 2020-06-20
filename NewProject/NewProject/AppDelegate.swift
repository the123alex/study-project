//
//  AppDelegate.swift
//  NewProject
//
//  Created by Aleksey on 14.03.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
      //  let defaults = UserDefaults.standard
        //if defaults.bool(forKey: "Enter") == false {
            let navigationController = StartupAssembly().create()
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            return true
//        } else {
//            window?.rootViewController = WeatherListAssembly(navigationController: UINavigationController()).create()
//            window?.makeKeyAndVisible()
//        }
    //    return true
    }

    // MARK: UISceneSession Lifecycle
}
