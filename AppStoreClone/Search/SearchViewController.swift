//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

final class SearchViewController: UICollectionViewController {
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.cellId, for: indexPath) as! SearchResultCell
        
        cell.configure(name: "App name", category: "Category", ratings: "Ratings")
        
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
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            
            guard let searchResult = try? JSONDecoder().decode(SearchResult.self, from: data) else { return }
            
            searchResult.results.forEach { print($0) }
            
        }.resume()
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}
