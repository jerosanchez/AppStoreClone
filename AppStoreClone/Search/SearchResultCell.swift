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
    
    lazy var screenshot1 = makeScreenshotView()
    lazy var screenshot2 = makeScreenshotView()
    lazy var screenshot3 = makeScreenshotView()

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        let labelsStackView = VerticalStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingsLabel
        ])
        
        let infoStackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelsStackView, getButton
        ])
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [
            screenshot1, screenshot2, screenshot3
        ])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let cellStackView = VerticalStackView(arrangedSubviews: [
            infoStackView, screenshotsStackView
        ], spacing: 16)
        
        addSubview(cellStackView)
        cellStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 0, right: 16))
    }
    
    private func makeScreenshotView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .blue
        
        return imageView
    }
}
