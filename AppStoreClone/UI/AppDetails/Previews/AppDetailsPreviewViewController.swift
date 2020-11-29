//
//  AppDetailsScreenshotsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsPreviewViewController: HSnappingCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }

    // MARK: - Helpers
    
    private var topBottomPadding: CGFloat { return 12 }
    private var overlapping: CGFloat { return 48 }

    private func setup() {
        collectionView.backgroundColor = .white

        collectionView.contentInset = .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: overlapping - 16)

        registerCells()
    }

    private func registerCells() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension AppDetailsPreviewViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding)
        return .init(width: view.frame.width - overlapping, height: height)
    }
}
