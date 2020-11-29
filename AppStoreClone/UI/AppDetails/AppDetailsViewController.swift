//
//  AppDetailsViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import UIKit

final class AppDetailsViewController: UICollectionViewController {
    
    var appId: String? {
        didSet {
            guard let appId = appId else { return }
            fetchData(for: appId)
        }
    }
    
    private var appDetails: AppDetails?
    
    private let appDetailsService = AppDetailsService()
 
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
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsInfoCell.cellId, for: indexPath) as! AppDetailsInfoCell
            cell.configure(with: appDetails)
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsPreviewCell.cellId, for: indexPath) as! AppDetailsPreviewCell
            cell.configure(with: appDetails)
            return cell
        }
    }
    
    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never

        registerCells()
        
        view.addSubview(spinnerView)
        spinnerView.fillSuperview()
    }
    
    private func registerCells() {
        collectionView.register(AppDetailsInfoCell.self, forCellWithReuseIdentifier: AppDetailsInfoCell.cellId)
        collectionView.register(AppDetailsPreviewCell.self, forCellWithReuseIdentifier: AppDetailsPreviewCell.cellId)
    }

    private func fetchData(for appId: String) {
        appDetailsService.load(appId: appId) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.spinnerView.stopAnimating()
            }
            
            switch result {
            case let .success(appDetails):
                DispatchQueue.main.async {
                    self.appDetails = appDetails
                    self.navigationItem.title = appDetails.trackName
                    self.collectionView.reloadData()
                }
                
            case let .failure(error):
                print("Load failed: \(error)")
            }
        }
    }
}

extension AppDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return .init(width: view.frame.width, height: requiredHeight())
            
        } else {
            return .init(width: view.frame.width, height: 500)
        }
    }
    
    private func requiredHeight() -> CGFloat {
        let arbitrarilyLargeHeight: CGFloat = 1000
        let dummyCell = AppDetailsInfoCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: arbitrarilyLargeHeight))
        dummyCell.configure(with: appDetails)
        dummyCell.layoutIfNeeded()
        
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 0))

        return estimatedSize.height
    }
}
