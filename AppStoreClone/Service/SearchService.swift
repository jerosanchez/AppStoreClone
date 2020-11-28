//
//  SearchViewModel.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import Foundation

final class SearchService {
    typealias LoadResult = Result<[SearchResultItem], Error>
    
    func load(searchTerm: String, completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=software") else { return }
        
        HTTPClient.get(from: url, completion: completion)
    }
}
