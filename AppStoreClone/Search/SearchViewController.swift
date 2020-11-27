//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

final class SearchViewController: UICollectionViewController {
    
    private let service = SearchService()
    private var searchResults = [SearchResultItem]()
    
    private let searchController = UISearchController()
    
    private var throttlingTimer: Timer?
    
    private let emptyStateLabel: UILabel = {
        let label = UILabel(text: "Please, enter you search term above...", font: .systemFont(ofSize: 20, weight: .bold))
        label.textAlignment = .center
        return label
    }()
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = searchResults.count
        
        emptyStateLabel.isHidden = count > 0
        
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.cellId, for: indexPath) as! SearchResultCell
        
        let result = searchResults[indexPath.item]
        cell.configure(with: result)
        
        return cell
    }
    
    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        registerCells()
        
        setupSearchBar()
        setupLayout()
    }
    
    private func registerCells() {
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.cellId)
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupLayout() {
        view.addSubview(emptyStateLabel)
        emptyStateLabel.fillSuperview()
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        throttlingTimer?.invalidate()
        
        throttlingTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            
            self.service.load(searchTerm: searchText) { [weak self] result in
                guard let self = self else { return }

                self.handleResult(result)
            }
        }
    }
    
    private func handleResult(_ result: SearchService.LoadResult) {
        switch result {
        case let .success(results):
            self.searchResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        case let .failure(error):
            print("Load failed: \(error)")
        }
    }
}
