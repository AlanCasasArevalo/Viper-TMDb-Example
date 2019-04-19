//
//  FeaturedHeaderLayout.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 19/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

final class FeaturedCollectionViewLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        
        scrollDirection = .vertical
        itemSize = CONSTANTS.POSTER_STRIP_LAYOUT_CONSTANTS.itemSize
        minimumLineSpacing = CONSTANTS.POSTER_STRIP_LAYOUT_CONSTANTS.minimumLineSpacing
        sectionInset = CONSTANTS.POSTER_STRIP_LAYOUT_CONSTANTS.sectionInset
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let targetRect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: collectionView.bounds.size)
        
        guard let attributes = layoutAttributesForElements(in: targetRect) else { return proposedContentOffset }
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        
        for itemAttributes in attributes {
            if itemAttributes.representedElementCategory != .cell{
                continue
            }
            let x = itemAttributes.frame.origin.x
            
            if abs(x - proposedContentOffset.x) < abs(offsetAdjustment) {
                offsetAdjustment = x - proposedContentOffset.x
            }
            
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment - sectionInset.left, y: proposedContentOffset.y)
        
    }
    
}
