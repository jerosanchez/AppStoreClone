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
    
    enum LoadResultError: Error {
        case serviceError
        case invalidaData
    }
    
    func load(completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=instagram&entity=software") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(.failure(LoadResultError.serviceError))
                return
            }
            
            guard let receivedDTO = try? JSONDecoder().decode(SearchResult.self, from: data) else {
                completion(.failure(LoadResultError.invalidaData))
                return
            }
            
            completion(.success(receivedDTO.results))
            
        }.resume()
    }
}
