//
//  AppAssembly.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import UIKit

final class AppAssembly {
    private(set) lazy var navigationController = UINavigationController()
    private (set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
    private (set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
}
