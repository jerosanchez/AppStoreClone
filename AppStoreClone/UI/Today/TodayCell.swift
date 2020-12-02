//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 2/12/20.
//

import UIKit

final class TodayCell: UICollectionViewCell {
    static var cellId: String { return TodayCell.description() }

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        backgroundColor = .white
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: SearchResultItem) {
    }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        
    }
}
