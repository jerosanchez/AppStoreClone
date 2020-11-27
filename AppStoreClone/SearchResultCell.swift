//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

final class SearchResultCell: UICollectionViewCell {
    
    static var cellId: String { return SearchResultCell.description() }
    
    let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.layer.cornerRadius = 12

        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "APP NAME"
        
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Photos & Video"
        
        return label
    }()

    let ratingsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "9.2M"
        
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 12

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingsLabel
        ])
        labelsStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelsStackView, getButton
        ])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
}
