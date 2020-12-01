//
//  AppDetailsReviewCardCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 30/11/20.
//

import UIKit

final class AppDetailsReviewCardCell: UICollectionViewCell {
    
    static var cellId: String { return AppDetailsReviewCardCell.description() }

    private let titleLabel: UILabel = {
        let label = UILabel(text: "Review title", font: .systemFont(ofSize: 16, weight: .bold))
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel(text: "Author", font: .systemFont(ofSize: 16, weight: .regular))
        label.textColor = .lightGray
        return label
    }()
    
    private let starsStackView = UIStackView()
    
    private let bodyLabel = UILabel(text: "Review body\nReview body\nReview body", font: .systemFont(ofSize: 14, weight: .regular), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 240/255, green: 239/255, blue: 248/255, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true

        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with appReview: AppReview) {
        titleLabel.text = appReview.title
        bodyLabel.text = appReview.content
        authorLabel.text = appReview.author
        
        (1...appReview.rating).forEach { _ in
            starsStackView.addArrangedSubview(makeStarImageView())
        }
        starsStackView.addArrangedSubview(UIView())
    }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        let headerStackView = UIStackView(arrangedSubviews: [
            titleLabel, UIView(), authorLabel
        ])
        headerStackView.spacing = 8
        
        let stackView = VerticalStackView(arrangedSubviews: [
            headerStackView, starsStackView, bodyLabel, UIView()
        ], spacing: 8)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    private func makeStarImageView() -> UIView {
        let starImageView = UIImageView(image: UIImage(named: "star"))
        starImageView.constraintWidth(constant: 24)
        starImageView.constraintHeight(constant: 24)
        return starImageView
    }
}
