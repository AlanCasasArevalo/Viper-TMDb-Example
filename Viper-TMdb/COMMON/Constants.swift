//
//  Constants.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import Foundation

let CONSTANTS = Constants()
//let defaults = UserDefaults(suiteName: "group.orange.everis.sp.miorange")


struct Constants {
    let CALLS = BaseUrls()
    let POSTER_STRIP_LAYOUT_CONSTANTS = PosterStripLayoutConstans()

}

struct BaseUrls {
    let BASE_URL = "https://api.themoviedb.org/3"
    let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/"
}

struct PosterStripLayoutConstans {
    let itemSize = CGSize(width: 106, height: 186)
    let minimumLineSpacing: CGFloat = 60
    let sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
}

