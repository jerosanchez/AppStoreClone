//
//  BaseCollectionViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

class HSnappingCollectionViewController: UICollectionViewController {
    
    convenience init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        self.init(collectionViewLayout: layout)
        
        collectionView.decelerationRate = .fast
    }
}

private class SnappingLayout: UICollectionViewFlowLayout {
 
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let nextX: CGFloat
        
        if proposedContentOffset.x <= 0 || collectionView.contentOffset == proposedContentOffset {
            nextX = proposedContentOffset.x
        } else {
            nextX = collectionView.contentOffset.x + (velocity.x > 0 ? collectionView.bounds.size.width : -collectionView.bounds.size.width)
        }
        
        let targetRect = CGRect(x: nextX, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        
        let horizontalOffset = proposedContentOffset.x + collectionView.contentInset.left
        
        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
        
        layoutAttributesArray?.forEach { (layoutAttributes) in
            let itemOffset = layoutAttributes.frame.origin.x
            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
