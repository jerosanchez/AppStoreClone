//
//  SearchViewModel.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import Foundation

final class SearchViewModel {
    
    func load(completion: @escaping ([SearchResultItem]) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=instagram&entity=software") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            
            guard let receivedDTO = try? JSONDecoder().decode(SearchResult.self, from: data) else { return }
            
            completion(receivedDTO.results)
            
        }.resume()
    }

}
