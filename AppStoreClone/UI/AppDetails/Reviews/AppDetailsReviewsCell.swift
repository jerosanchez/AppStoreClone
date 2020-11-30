//
//  AppDetailsReviewsCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 30/11/20.
//

import UIKit

final class AppDetailsReviewsCell: UICollectionViewCell {
    
    static var cellId: String { return AppDetailsReviewsCell.description() }
    
    private let reviewsLabel = UILabel(text: "Reviews & Ratings", font: .systemFont(ofSize: 20, weight: .bold), numberOfLines: 1)
    
    private let horizontalController = AppDetailsReviewsController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with appDetails: AppDetails?) { }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        addSubview(reviewsLabel)
        reviewsLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: reviewsLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
}
