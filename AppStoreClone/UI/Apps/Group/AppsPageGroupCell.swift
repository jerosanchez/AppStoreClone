//
//  AppsGroupCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class AppsPageGroupsCell: UICollectionViewCell {

    static var cellId: String { return AppsPageGroupsCell.description() }
    
    private let titleLabel = UILabel(text: "App Section", font: .systemFont(ofSize: 30, weight: .bold))
    
    private let horizontalController = AppsGroupViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: AppsGroup, onResultTapped: @escaping (AppsGroupItem) -> Void) {
        titleLabel.text = model.title
        horizontalController.loadResults = model.results
        horizontalController.onResultTapped = onResultTapped
    }
}
