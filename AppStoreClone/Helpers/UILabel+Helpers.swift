//
//  UILabel+Helpers.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = nil) {
        self.init(frame: .zero)
        
        self.text = text
        
        if let font = font { self.font = font }
    }
}
