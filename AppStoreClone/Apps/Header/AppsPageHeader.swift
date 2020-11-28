//
//  AppsPageHeader.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    static var cellId: String { return AppsPageHeader.description() }
    
    private let horizontalController = AppsHeaderViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
