//
//  ImageRepository.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import UIKit

public protocol ImageRepositoryProtocol {
    func imageFromApi(path: String, size: ImageSize, completion : @escaping (UIImage?) -> ())
}

final internal class ImageRepository: ImageRepositoryProtocol {
    
    var imageBaseURL: URL?
    let imageManager: ImageManagerProtocol
    
    init ( webService: WebService, imageManager: ImageManagerProtocol ) {
        self.imageBaseURL = URL(string: CONSTANTS.CALLS.BASE_IMAGE_URL)
        self.imageManager = imageManager
    }
    
    func imageFromApi(path: String, size: ImageSize, completion : @escaping (UIImage?) -> ()) {
        let imageManager = self.imageManager
        
        imageBaseURL.map { url in
            url.appendingPathComponent(size.rawValue).appendingPathComponent(path)
            }.flatMap { url in
                imageManager.imageFromURL(withURL: url, completion: { image in
                    completion(image)
                })
            }
    }
}

