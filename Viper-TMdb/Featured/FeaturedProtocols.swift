//
//  FeaturedProtocols.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol FeaturedPresenterProtocol: class {
    var interactor: FeaturedInteractorProtocol? { get }
    var model: [Movie]? { get set }
    func getDataFromPresenter(region: String, offset: Int, completion: @escaping ([Movie]?) -> ()) 
}

protocol FeaturedViewControllerProtocol: class {
    
}

protocol FeaturedWireframeProtocol: class {
    
}

protocol FeaturedInteractorProtocol: class {
    var webServiceAssembly: WebServiceAssembly? { get }
    func getDataFromInteractor(region: String, offset: Int, completion : @escaping ([Movie]?) -> () )
}
