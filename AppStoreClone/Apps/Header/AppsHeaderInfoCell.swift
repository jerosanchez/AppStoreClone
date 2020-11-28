//
//  AppsHeaderInfoCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import UIKit

class AppsHeaderInfoCell: UICollectionViewCell {
    
    static var cellId: String { return AppsGroupInfoCell.description() }

    private let companyLabel: UILabel = {
        let label = UILabel(text: "Twitter", font: .systemFont(ofSize: 12, weight: .bold))
        label.textColor = .blue
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(text: "Keeping up with your interests is easier than ever.", font: .systemFont(ofSize: 24, weight: .regular))
        label.numberOfLines = 2
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(cornerRadius: 8)
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            companyLabel, titleLabel, imageView
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: AppsHeaderItem) {
        companyLabel.text = model.name
        titleLabel.text = model.tagline
        imageView.sd_setImage(with: URL(string: model.imageUrl))
    }
}
