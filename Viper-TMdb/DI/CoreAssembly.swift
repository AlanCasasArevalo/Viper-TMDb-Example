//
//  CoreAssembly.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

final public class CoreAssembly {
    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
    private(set) lazy var featuredAssembly = FeaturedAssembly(webServiceAssembly: webServiceAssembly)
    
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
