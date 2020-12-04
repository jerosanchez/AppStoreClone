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

    private let imageView = UIImageView(image: UIImage(named: "garden"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        backgroundColor = .white
        layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFit

        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: SearchResultItem) {
    }
    
    func enableCloseButton(onTap handleDidTapCloseButton: Selector, target: Any?) {
        closeButton.isHidden = false
        closeButton.addTarget(target, action: handleDidTapCloseButton, for: .touchUpInside)
    }
    
    func disableCloseButton() {
        closeButton.isHidden = true
    }
    
    // MARK: - Helpers
    
    private func setupLayout() {
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
        
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 12))
    }
}
