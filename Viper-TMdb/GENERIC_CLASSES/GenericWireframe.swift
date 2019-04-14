//
//  GenericWireframe.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

class GenericWireframe <T: AnyObject, U, V> {
    internal var viewController: T?
    internal var presenter: U?
    internal var interactor: V?
    init(viewController: T, presenter: U? = nil, interactor: V? = nil) {
        self.viewController = viewController
    }
}
