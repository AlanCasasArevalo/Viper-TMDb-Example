//
//  Person.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
struct Person: Decodable {
    let identifier: Int64
    let name: String
    let profilePath: String?
    let knownFor: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}
