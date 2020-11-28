//
//  UIImageView+Helpers.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import UIKit

extension UIImageView {
    
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
