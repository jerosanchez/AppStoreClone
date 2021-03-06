//
//  AppsGroupViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class AppsGroupViewController: HSnappingCollectionViewController {
    
    var loadResults = [AppsGroupItem]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var onResultTapped: (AppsGroupItem) -> Void = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loadResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupInfoCell.cellId, for: indexPath) as! AppsGroupInfoCell
        cell.configure(with: loadResults[indexPath.item])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let result = loadResults[indexPath.item]
        onResultTapped(result)
    }
    
    // MARK: - Helpers
    
    private var topBottomPadding: CGFloat { return 12 }
    private var overlapping: CGFloat { return 48 }

    private func setup() {
        collectionView.backgroundColor = .white

        collectionView.contentInset = .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: overlapping - 16)

        registerCells()
    }
    
    private func registerCells() {
        collectionView.register(AppsGroupInfoCell.self, forCellWithReuseIdentifier: AppsGroupInfoCell.cellId)
    }
}

extension AppsGroupViewController: UICollectionViewDelegateFlowLayout {
    
    private var lineSpacing: CGFloat { return 10 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * lineSpacing - 2 * topBottomPadding) / 3
        return .init(width: view.frame.width - overlapping, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
