//
//  UIView+LayoutHelpers.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

extension UIView {
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        guard let superview = self.superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right),
        ])
    }
}
