//
//  BaseCollectionViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
}
