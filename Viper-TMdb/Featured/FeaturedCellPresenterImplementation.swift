//
//  FeaturedCellPresenter.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 19/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol FeaturedCellPresenterProtocol {
    var imageRepositoryProtocol : ImageRepositoryProtocol {get}
    var dateFormatter: DateFormatter {get}
    func moviePresentation (movie: Movie, cell: FeaturedViewCell)    
}

class FeaturedCellPresenterImplementation: FeaturedCellPresenterProtocol {
    
    var imageRepositoryProtocol : ImageRepositoryProtocol
    var dateFormatter: DateFormatter
    
    init(imageRepositoryProtocol : ImageRepositoryProtocol, dateFormatter: DateFormatter) {
        self.imageRepositoryProtocol = imageRepositoryProtocol
        self.dateFormatter = dateFormatter
    }
    
    func moviePresentation (movie: Movie, cell: FeaturedViewCell) {
        DispatchQueue.main.async {
            self.bind(path: movie.backdropPath, cell: cell)
            
            cell.titleLabel.text = movie.title
            cell.metaLabel.text = movie.releaseDate
        }
    }
    
}

extension FeaturedCellPresenterImplementation {
    func bind (path: String?, cell: FeaturedViewCell) {
        guard let path = path else { return }
        
        imageRepositoryProtocol.imageFromApi(path: path, size: .w342) { image in
            DispatchQueue.main.async {
                cell.dataImageView.image = image
            }
        }
    }
}
