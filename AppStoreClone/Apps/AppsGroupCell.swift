//
//  AppsGroupCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class AppsGroupsCell: UICollectionViewCell {

    static var cellId: String { return AppsGroupsCell.description() }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "App Section"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
