//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit
import SDWebImage

final class SearchPageResultCell: UICollectionViewCell {
    
    static var cellId: String { return SearchPageResultCell.description() }
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView(cornerRadius: 12)
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return imageView
    }()
    
    private let nameLabel = UILabel(text: "APP NAME")
    
    private let categoryLabel = UILabel(text: "Photos & Video")

    private let ratingsLabel = UILabel(text: "9.2M")
    
    private let getButton: UIButton = {
        let button = UIButton(title: "GET")
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var screenshot1 = makeScreenshotView()
    private lazy var screenshot2 = makeScreenshotView()
    private lazy var screenshot3 = makeScreenshotView()

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SearchResultItem) {
        nameLabel.text = model.trackName
        
        categoryLabel.text = model.primaryGenreName
        
        let rating = String(format: "%0.1f", model.averageUserRating ?? 0.0)
        ratingsLabel.text = "Rating: \(rating)"
        
        appIconImageView.sd_setImage(with: URL(string: model.artworkUrl100))
        
        let screentshotCount = model.screenshotUrls.count
        if screentshotCount > 0 {
            screenshot1.sd_setImage(with: URL(string: model.screenshotUrls[0]))
        }
        if screentshotCount > 1 {
            screenshot2.sd_setImage(with: URL(string: model.screenshotUrls[1]))
        }
        if screentshotCount > 2 {
            screenshot3.sd_setImage(with: URL(string: model.screenshotUrls[2]))
        }
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
        
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.init(white: 0.75, alpha: 1).cgColor
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }
}
