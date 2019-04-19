//
//  ImageManager.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import UIKit

internal protocol ImageManagerProtocol {
    func imageFromURL(withURL url: URL, completion: @escaping (UIImage?) -> ())
}

class ImageManager: ImageManagerProtocol {
    func imageFromURL(withURL url: URL, completion: @escaping (UIImage?) -> ()) {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let dataDes = data else {return}
            let statusCode = (response as! HTTPURLResponse).statusCode
            if (error == nil) {
                let image = UIImage(data: dataDes)
                completion(image)
            }else {
                print("URL Session Log in Task Failed: %@", error!.localizedDescription);
                completion(nil)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}

