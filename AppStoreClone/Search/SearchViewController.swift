//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

final class SearchViewController: UICollectionViewController {
    
    private var searchResults = [SearchResultItem]()
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.cellId, for: indexPath) as! SearchResultCell
        
        let result = searchResults[indexPath.item]
        let rating = String(format: "%0.1f", result.averageUserRating ?? 0.0)
        cell.configure(name: result.trackName, category: result.primaryGenreName, ratings: "Rating: \(rating)")
        
        return cell
    }
    
    // MARK: - Helpers
    
    private func setup() {
        collectionView.backgroundColor = .white

        registerCells()
    }
    
    private func registerCells() {
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.cellId)
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=instagram&entity=software") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard error == nil, let data = data else { return }
            
            guard let receivedDTO = try? JSONDecoder().decode(SearchResult.self, from: data) else { return }
            
            self.searchResults = receivedDTO.results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }.resume()
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}
