//
//  CoreAssembly.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class CoreAssembly {
    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
}
