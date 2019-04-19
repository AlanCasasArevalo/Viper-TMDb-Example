//
//  FeaturedPresenterImplementation.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import UIKit

protocol FeaturedPresenterProtocol: class {
    var interactor: FeaturedInteractorProtocol? { get }
    var model: [Movie]? { get set }
    func initFeaturedView (region: String, offset: Int, completion: @escaping ([Movie]?) -> ())
}

class FeaturedPresenterImplementation: GenericPresenter<FeaturedViewController, FeaturedWireframeProtocol, FeaturedInteractorProtocol>, FeaturedPresenterProtocol {
    
    var model: [Movie]?
    
    func initFeaturedView(region: String, offset: Int, completion: @escaping ([Movie]?) -> ()) {
        showPostersInCollectionView()
        self.viewController?.collectionView.register(UINib(nibName: FeaturedViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: FeaturedViewCell.defaultReuseIdentifier)
        self.interactor?.getDataFromInteractor(region: region, offset: offset, completion: { movies in
            completion(movies)
        })
    }
    
    internal func showPostersInCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        let cellSpacing = CGFloat(1)
        let leftRightMargin = CGFloat(10)
        let numColumns = CGFloat(1)
        let totalCellSpace = cellSpacing * (numColumns - 1)
        let screenWidth = UIScreen.main.bounds.width - 20
        let width = (screenWidth - leftRightMargin - totalCellSpace) / numColumns
        var height = CGFloat(200)
        height = width * height / 280
        flowLayout.itemSize = CGSize(width: width, height: height)
        self.viewController?.collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
}
