//
//  AppsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class AppsViewController: UICollectionViewController {
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .gray
        
        return cell
    }
    
    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        registerCells()
    }
    
    private func registerCells() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension AppsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
