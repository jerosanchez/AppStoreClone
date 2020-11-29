//
//  AppDetailsScreenshotCell.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsScreenshotCell: UICollectionViewCell {
    
    static var cellId: String { return AppDetailsScreenshotCell.description() }

    private let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .lightGray
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageURL: String) {
        imageView.sd_setImage(with: URL(string: imageURL))
    }
}
