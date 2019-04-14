//
//  FeaturedViewController.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 14/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

//class LoginViewController: GenericViewController<LoginPresenterProtocol>, LoginViewControllerProtocol {

class FeaturedViewController: GenericViewController <FeaturedPresenterProtocol>, FeaturedViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDataFromPresenter(region: "es", offset: 1, completion: { movies in
            print(movies)
        })
    
    }
}
