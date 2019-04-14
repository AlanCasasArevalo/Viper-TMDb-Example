//
//  FeaturedRepository.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol FeaturedRepositoryProtocol {
    var webserviceAssembly: WebServiceAssembly { get }
    func movieNowPlaying(region: String, page: Int , completion: @escaping ([Movie]?) -> ()) 
}

final class FeaturedRepositoryImplementation: FeaturedRepositoryProtocol {
    var webserviceAssembly: WebServiceAssembly
    init(webserviceAssembly: WebServiceAssembly) {
        self.webserviceAssembly = webserviceAssembly
    }
    
    func movieNowPlaying(region: String, page: Int , completion: @escaping ([Movie]?) -> ()) {
        webserviceAssembly.webService.loadGenericFromApi(type: Page<Movie>.self, endpoint: .moviesNowPlaying(region: region, page: page)) { movies in
            guard let resultDes = movies else { return }
            completion(resultDes.results)
        }
    }

}










