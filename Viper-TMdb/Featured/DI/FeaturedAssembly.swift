//
//  FeaturedAssembly.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final class FeaturedAssembly {
    private let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly : WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
    
    func getFeaturedViewController () -> FeaturedViewController {
        let viewController = FeaturedViewController(nibName: "FeaturedViewController", bundle: nil)
        viewController.presenter = getFeaturedPresenter(viewController: viewController)
        return viewController
    }
    
    func getFeaturedPresenter(viewController: FeaturedViewController) -> FeaturedPresenterProtocol {
        let presenter = FeaturedPresenterImplementation(viewController: viewController)
        presenter.interactor = getFeaturedInteractor(viewController: viewController)
        return presenter
    }
    
    func getFeaturedInteractor (viewController: FeaturedViewController) -> FeaturedInteractorProtocol {
        let interactor = FeaturedIntereactorImplementation()
        interactor.webServiceAssembly = webServiceAssembly
        interactor.featuredRepositoryProtocol = getFeaturedRepository()
        return interactor
    }
    
    func getFeaturedWireframe(viewController: FeaturedViewController) -> FeaturedWireframeProtocol{
        let wireframe = FeaturedWireframeImplementation(viewController: viewController)
        return wireframe
    }
    
    func getFeaturedRepository () -> FeaturedRepositoryProtocol {
        let featuredRepository = FeaturedRepositoryImplementation(webserviceAssembly: webServiceAssembly)
        return featuredRepository
    }
    
}
