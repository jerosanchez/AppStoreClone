//
//  AppDetailsInfoCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsInfoCell: UICollectionViewCell {
    
    static var cellId: String { return AppDetailsInfoCell.description() }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
