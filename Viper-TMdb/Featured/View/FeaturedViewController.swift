//
//  FeaturedViewController.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit


protocol FeaturedViewControllerProtocol: class {
//    func updateView(with movies: [Movie])
//    func updateView(with shows: [Show])
}

class FeaturedViewController: GenericViewController <FeaturedPresenterProtocol>, FeaturedViewControllerProtocol, ReuseIdentifierInterfaceViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let featuredCellPresenter: FeaturedCellPresenterProtocol
    
    init(featuredCellPresenter: FeaturedCellPresenterProtocol) {
        self.featuredCellPresenter = featuredCellPresenter
        super.init(nibName: "FeaturedViewController", bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.initFeaturedView(region: "en-US", offset: 1, completion: { movies in
            self.presenter?.model = movies

            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        })
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.presenter?.model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataToShow = presenter?.model?[indexPath.section]
        
        let featuredViewCell: FeaturedViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedViewCell.defaultReuseIdentifier, for: indexPath) as! FeaturedViewCell
        featuredCellPresenter.moviePresentation(movie: dataToShow!, cell: featuredViewCell)
        
        return featuredViewCell
    }
    
}
