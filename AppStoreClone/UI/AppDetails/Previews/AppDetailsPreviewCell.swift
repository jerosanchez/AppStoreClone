//
//  AppDetailsScreenshotsCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsPreviewCell: UICollectionViewCell {
    
    static var cellId: String { return AppDetailsPreviewCell.description() }

    private let horizontalController = AppDetailsPreviewViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: AppDetails?) {
        
    }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
    }
}
