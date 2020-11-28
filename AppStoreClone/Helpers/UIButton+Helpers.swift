//
//  UIButton+Helpers.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import UIKit

extension UIButton {
    
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
