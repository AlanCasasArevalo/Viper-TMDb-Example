//
//  Constants.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

let CONSTANTS = Constants()
//let defaults = UserDefaults(suiteName: "group.orange.everis.sp.miorange")


struct Constants {
    let CALLS = BaseUrls()
}

struct BaseUrls {
    let BASE_URL = "https://api.themoviedb.org/3"
    let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/"
}

