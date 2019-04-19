//
//  FeaturedIntereactorImplementation.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol FeaturedInteractorProtocol: class {
    var webServiceAssembly: WebServiceAssembly? { get }
    func getDataFromInteractor(region: String, offset: Int, completion : @escaping ([Movie]?) -> () )
}

class FeaturedIntereactorImplementation: GenericInteractor<FeaturedPresenterProtocol>, FeaturedInteractorProtocol {
    var webServiceAssembly: WebServiceAssembly?
    var featuredRepositoryProtocol: FeaturedRepositoryProtocol?
    
    func getDataFromInteractor(region: String, offset: Int, completion: @escaping ([Movie]?) -> ()) {
        featuredRepositoryProtocol?.movieNowPlaying(region: region, page: offset, completion: { movies in
            completion(movies)
        })
    }
}
