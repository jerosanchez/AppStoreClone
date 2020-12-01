//
//  AppDetailsReviewsController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 30/11/20.
//

import UIKit

final class AppDetailsReviewsController: HSnappingCollectionViewController {
    
    var appReviews = [AppReview]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appReviews.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsReviewCardCell.cellId, for: indexPath) as! AppDetailsReviewCardCell
        cell.configure(with: appReviews[indexPath.item])
        return cell
    }

    // MARK: - Helpers
    
    private var bottomPadding: CGFloat = 16
    
    private func setup() {
        collectionView.backgroundColor = .white

        collectionView.contentInset = .init(top: 0, left: 16, bottom: bottomPadding, right: 16)

        registerCells()
    }

    private func registerCells() {
        collectionView.register(AppDetailsReviewCardCell.self, forCellWithReuseIdentifier: AppDetailsReviewCardCell.description())
    }
}

extension AppDetailsReviewsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height - bottomPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
