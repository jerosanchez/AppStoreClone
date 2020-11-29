//
//  AppsHeaderViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import UIKit

class AppsHeaderViewController: HSnappingCollectionViewController {
    
    var headerItems = [AppsHeaderItem]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderInfoCell.cellId, for: indexPath) as! AppsHeaderInfoCell
        cell.configure(with: headerItems[indexPath.item])
        return cell
    }

    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        registerCells()
    }

    private func registerCells() {
        collectionView.register(AppsHeaderInfoCell.self, forCellWithReuseIdentifier: AppsHeaderInfoCell.cellId)
    }
}

extension AppsHeaderViewController: UICollectionViewDelegateFlowLayout {
    
    private var topBottomPadding: CGFloat { return 12 }
    private var overlapping: CGFloat { return 48 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding)
        return .init(width: view.frame.width - overlapping, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
}
