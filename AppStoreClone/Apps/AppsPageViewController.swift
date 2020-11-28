//
//  AppsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class AppsPageViewController: UICollectionViewController {
    
    private let service = AppsService()
    private var loadResult: AppsLoadResult?

    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loadResult != nil ? 1 : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let loadResult = loadResult else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPageGroupsCell.cellId, for: indexPath) as! AppsPageGroupsCell
        cell.configure(with: loadResult)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageHeader.cellId, for: indexPath)
        return header
    }
    
    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        registerCells()
    }
    
    private func registerCells() {
        collectionView.register(AppsPageGroupsCell.self, forCellWithReuseIdentifier: AppsPageGroupsCell.cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageHeader.cellId)
    }
    
    private func fetchData() {
        service.load(category: .topFree) { result in
            switch result {
            case let .success(loadResult):
                self.loadResult = loadResult
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            case let .failure(error):
                print("Load failed: \(error)")
            }
        }
    }
}

extension AppsPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
