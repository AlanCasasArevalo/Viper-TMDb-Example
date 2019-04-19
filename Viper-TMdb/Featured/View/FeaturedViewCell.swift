//
//  FeaturedViewCell.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 19/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class FeaturedViewCell: UICollectionViewCell, ReuseIdentifierInterface {

    @IBOutlet weak var dataImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metaLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
