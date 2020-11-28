//
//  AppsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class AppsPageViewController: UICollectionViewController {
    
    private let service = AppsService()
    private var groups = [AppsLoadResult]()

    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPageGroupsCell.cellId, for: indexPath) as! AppsPageGroupsCell
        cell.configure(with: groups[indexPath.item])
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
        service.load(category: .topFree) { [weak self] result in
            guard let self = self else { return }
            self.handleResult(result)
        }
        
        service.load(category: .topGrossing) { [weak self] result in
            guard let self = self else { return }
            self.handleResult(result)
        }

        service.load(category: .newGames) { [weak self] result in
            guard let self = self else { return }
            self.handleResult(result)
        }
    }
    
    private func handleResult(_ result: AppsService.LoadResult) {
        switch result {
        case let .success(loadResult):
            self.groups.append(loadResult)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        case let .failure(error):
            print("Load failed: \(error)")
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
