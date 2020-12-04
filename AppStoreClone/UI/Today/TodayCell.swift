//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 2/12/20.
//

import UIKit

final class TodayCell: UICollectionViewCell {
    
    static var cellId: String { return TodayCell.description() }

    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    private let categoryLabel = UILabel(text: "", font: .systemFont(ofSize: 20, weight: .regular))
    
    private let titleLabel = UILabel(text: "", font: .systemFont(ofSize: 26, weight: .regular))

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.constraintHeight(constant: 200)
        return imageView
    }()
    
    private let descriptionLabel = UILabel(text: "", font: .systemFont(ofSize: 16, weight: .regular), numberOfLines: 3)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        backgroundColor = .white
        layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFit

        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: TodayCellViewModel) {
        categoryLabel.text = model.category
        titleLabel.text = model.title
        imageView.image = model.image
        descriptionLabel.text = model.description
        backgroundColor = model.bgColor
    }
    
    func enableCloseButton(onTap handleDidTapCloseButton: Selector, target: Any?) {
        closeButton.isHidden = false
        closeButton.addTarget(target, action: handleDidTapCloseButton, for: .touchUpInside)
    }
    
    func disableCloseButton() {
        closeButton.isHidden = true
    }
    
    // MARK: - Helpers
    
    var topConstraint: NSLayoutConstraint!
    
    private func setupLayout() {
        let stackView = VerticalStackView(arrangedSubviews: [
            categoryLabel, titleLabel, imageView, descriptionLabel, UIView()
        ], spacing: 8)
        addSubview(stackView)
        
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint.isActive = true
        
        addSubview(closeButton)
        closeButton.anchor(top: categoryLabel.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 24))
    }
}
