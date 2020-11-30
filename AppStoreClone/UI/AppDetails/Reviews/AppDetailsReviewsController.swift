//
//  AppDetailsReviewsController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 30/11/20.
//

import UIKit

final class AppDetailsReviewsController: HSnappingCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }

    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        registerCells()
    }

    private func registerCells() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension AppDetailsReviewsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
