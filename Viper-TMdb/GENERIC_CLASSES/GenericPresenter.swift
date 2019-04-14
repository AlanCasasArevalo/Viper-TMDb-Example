//
//  GenericPresenter.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

class GenericPresenter <T: AnyObject, U, V> {
    
    internal weak var viewController: T?
    internal var wireframe: U?
    internal var interactor: V?
    
    convenience init (viewController: T, wireframe: U? = nil, interactor: V? = nil) {
        self.init()
        self.viewController = viewController
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
}
