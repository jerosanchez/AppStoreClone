//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

final class SearchResultCell: UICollectionViewCell {
    
    static var cellId: String { return SearchResultCell.description() }
    
    let imageView: UIImageView = {
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

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingsLabel
        ])
        labelsStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, labelsStackView, getButton
        ])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
