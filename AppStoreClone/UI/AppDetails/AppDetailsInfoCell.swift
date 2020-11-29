//
//  AppDetailsInfoCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsInfoCell: UICollectionViewCell {
    
    static var cellId: String { return AppDetailsInfoCell.description() }

    let appIconImageView: UIImageView = {
        let imageView = UIImageView(cornerRadius: 16)
        imageView.constraintWidth(constant: 140)
        imageView.constraintHeight(constant: 140)
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 24, weight: .bold), numberOfLines: 2)
    
    let priceButton: UIButton = {
        let button = UIButton(title: "$4.99")
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.constraintHeight(constant: 32)
        button.layer.cornerRadius = CGFloat(32 / 2)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.contentEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
        return button
    }()
    
    let whatsNewLabel = UILabel(text: "What's new", font: .systemFont(ofSize: 20, weight: .bold))
    
    let releaseNotes = UILabel(text: "Release notes", font: .systemFont(ofSize: 18, weight: .regular), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: AppDetails?) {
        appIconImageView.sd_setImage(with: URL(string: model?.artworkUrl100 ?? ""))
        nameLabel.text = model?.trackName
        priceButton.setTitle(model?.formattedPrice, for: .normal)
        releaseNotes.text = model?.releaseNotes
    }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [
            priceButton, UIView()
        ])
        
        let infoStackView = VerticalStackView(arrangedSubviews: [
            nameLabel, buttonStackView, UIView()
        ], spacing: 12)
        
        let headerStackView = UIStackView(arrangedSubviews: [
            appIconImageView, infoStackView
        ])
        headerStackView.spacing = 20
        
        let stackView = VerticalStackView(arrangedSubviews: [
            headerStackView, whatsNewLabel, releaseNotes, UIView()
        ], spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 0, right: 20))
    }
}
