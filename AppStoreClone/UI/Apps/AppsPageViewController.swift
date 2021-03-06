//
//  AppsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class AppsPageViewController: UICollectionViewController {
    
    private let appsService = AppsGroupService()
    private let appsHeaderService = AppsHeaderService()
    private var groupLoadResults = [AppsGroup]()
    private var appsHeaderItems = [AppsHeaderItem]()

    private let spinnerView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.color = .black
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupLoadResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPageGroupsCell.cellId, for: indexPath) as! AppsPageGroupsCell
        cell.configure(with: groupLoadResults[indexPath.item], onResultTapped: handleResultTapped)
        return cell
    }
    
    private func handleResultTapped(_ result: AppsGroupItem) {
        let vc = AppDetailsViewController(appId: result.id)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageHeader.cellId, for: indexPath) as! AppsPageHeader
        header.configure(with: appsHeaderItems)
        return header
    }
    
    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        registerCells()
        
        view.addSubview(spinnerView)
        spinnerView.fillSuperview()
    }
    
    private func registerCells() {
        collectionView.register(AppsPageGroupsCell.self, forCellWithReuseIdentifier: AppsPageGroupsCell.cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageHeader.cellId)
    }
    
    private func fetchData() {
        var groups: [AppsGroup?] = [nil, nil, nil]
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        appsService.load(group: .topFree) { [weak self] result in
            guard let self = self else { return }
            groups[0] = self.map(result)
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        appsService.load(group: .topGrossing) { [weak self] result in
            guard let self = self else { return }
            groups[1] = self.map(result)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        appsService.load(group: .newGames) { [weak self] result in
            guard let self = self else { return }
            groups[2] = self.map(result)
            dispatchGroup.leave()
        }
        
        appsHeaderService.load { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(loadResult):
                self.appsHeaderItems = loadResult
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            case let .failure(error):
                print("Load failed: \(error)")
            }
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            
            let loadedGroups = groups.compactMap { $0 }
            self.groupLoadResults.append(contentsOf: loadedGroups)
            self.collectionView.reloadData()
            
            self.spinnerView.stopAnimating()
        }
    }
    
    private func map(_ result: AppsGroupService.LoadResult) -> AppsGroup? {
        switch result {
        case let .success(loadResult):
            return loadResult
            
        case let .failure(error):
            print("Load failed: \(error)")
            return nil
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
