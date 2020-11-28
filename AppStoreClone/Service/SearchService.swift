//
//  SearchViewModel.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import Foundation

final class SearchService {
    
    enum LoadResult {
        case success([SearchResultItem])
        case failure(Error)
    }
    
    func load(searchTerm: String, completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=software") else { return }
        
        HTTPClient.get(from: url) { (result: Result<[SearchResultItem], Error>) in
            switch result {
            case let .success(items):
                completion(.success(items))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
