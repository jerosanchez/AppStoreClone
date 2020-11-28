//
//  AppsService.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

enum AppsCategory: String {
    case topFree = "top-free"
    case newGames = "new-games-we-love"
    case topGrossing = "top-grossing"
}

final class AppsService {
    
    enum LoadResult {
        case success(AppsLoadResult)
        case failure(Error)
    }
    
    enum LoadResultError: Error {
        case serviceError
        case invalidaData
    }
    
    func load(category: AppsCategory, completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/\(category.rawValue)/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(.failure(LoadResultError.serviceError))
                return
            }
            
            guard let receivedDTO = try? JSONDecoder().decode(Root.self, from: data) else {
                completion(.failure(LoadResultError.invalidaData))
                return
            }
            
            completion(.success(receivedDTO.feed))
            
        }.resume()
    }
}

private struct Root: Decodable {
    let feed: AppsLoadResult
}
