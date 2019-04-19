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
    private let imageLoadingAssembly: ImageLoadingAssembly

    init(webServiceAssembly : WebServiceAssembly, imageLoadingAssembly: ImageLoadingAssembly) {
        self.webServiceAssembly = webServiceAssembly
        self.imageLoadingAssembly = imageLoadingAssembly
    }
    
    func getFeaturedViewController () -> FeaturedViewController {
        let viewController = FeaturedViewController(featuredCellPresenter: getFeaturedCellPresenter())
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
    
    func getFeaturedCellPresenter () -> FeaturedCellPresenterProtocol {
        let featuredCellPresenter = FeaturedCellPresenterImplementation(imageRepositoryProtocol: imageLoadingAssembly.image, dateFormatter: webServiceAssembly.dateFormatter)
        
        return featuredCellPresenter
    }
    
}
