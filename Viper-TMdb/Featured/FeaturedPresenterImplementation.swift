//
//  FeaturedPresenterImplementation.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

class FeaturedPresenterImplementation: GenericPresenter<FeaturedViewController, FeaturedWireframeProtocol, FeaturedInteractorProtocol>, FeaturedPresenterProtocol {
    var model: [Movie]?
    
    func getDataFromPresenter(region: String, offset: Int, completion: @escaping ([Movie]?) -> ()) {
        self.interactor?.getDataFromInteractor(region: region, offset: offset, completion: { movies in
            completion(movies)
        })
    }
}
