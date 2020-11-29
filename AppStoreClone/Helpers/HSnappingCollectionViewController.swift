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
    }

}

private class SnappingLayout: UICollectionViewFlowLayout {
    
}
