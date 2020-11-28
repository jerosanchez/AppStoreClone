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
    
    func anchor(top: NSLayoutAnchor<NSLayoutYAxisAnchor>?, leading: NSLayoutAnchor<NSLayoutXAxisAnchor>?, bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>?, trailing: NSLayoutAnchor<NSLayoutXAxisAnchor>?, padding: UIEdgeInsets = .zero) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }

        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
    }
    
    func constraintWidth(constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func constraintHeight(constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
}
