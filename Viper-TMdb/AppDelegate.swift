//
//  AppDelegate.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialVC = appAssembly.coreAssembly.featuredAssembly.getFeaturedViewController()
        appAssembly.window.makeKeyAndVisible()
        appAssembly.navigationController.pushViewController(initialVC, animated: false)
        appAssembly.window.rootViewController = appAssembly.coreAssembly.featuredAssembly.getFeaturedViewController()
     
        return true
    }

}

