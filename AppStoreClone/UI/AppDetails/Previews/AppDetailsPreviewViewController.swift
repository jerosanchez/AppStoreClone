//
//  AppDetailsScreenshotsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsPreviewViewController: HSnappingCollectionViewController {
    
    var appDetails: AppDetails? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDetails?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let appDetails = appDetails else { return AppDetailsScreenshotCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsScreenshotCell.cellId, for: indexPath) as! AppDetailsScreenshotCell
        cell.configure(with: appDetails.screenshotUrls[indexPath.item])
        return cell
    }

    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        registerCells()
    }

    private func registerCells() {
        collectionView.register(AppDetailsScreenshotCell.self, forCellWithReuseIdentifier: AppDetailsScreenshotCell.cellId)
    }
}

extension AppDetailsPreviewViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}
