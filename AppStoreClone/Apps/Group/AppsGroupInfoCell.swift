//
//  AppInfoCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import UIKit

class AppsGroupInfoCell: UICollectionViewCell {
    
    static var cellId: String { return AppsGroupInfoCell.description() }
    
    let imageView: UIImageView = {
        let imageView = UIImageView(cornerRadius: 8)
        imageView.backgroundColor = .lightGray
        imageView.constraintWidth(constant: 64)
        imageView.constraintHeight(constant: 64)
        return imageView
    }()
    
    let nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 20, weight: .regular))
    
    let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 13, weight: .regular))
    
    let getButton: UIButton = {
        let button = UIButton(title: "GET")
        button.backgroundColor = .init(white: 0.95, alpha: 1)
        button.constraintWidth(constant: 80)
        button.constraintHeight(constant: 32)
        button.layer.cornerRadius = 32 / 2
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let infoStackView = VerticalStackView(arrangedSubviews: [
            nameLabel, companyLabel
        ], spacing: 4)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, infoStackView, getButton
        ])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
