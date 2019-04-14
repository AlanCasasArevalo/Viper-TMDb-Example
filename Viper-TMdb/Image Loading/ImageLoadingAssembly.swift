//
//  ImageLoadingAssembly.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final class ImageLoadingAssembly {
    let webServiceAssembly : WebServiceAssembly
    private let imageManager = ImageManager()
    private (set) lazy var image = ImageRepository(webService: webServiceAssembly.webService, imageManager: imageManager)
    
    init(webServiceAssembly : WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
}
