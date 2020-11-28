//
//  AppsGroupService.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

final class AppsGroupService {
    
    enum LoadResult {
        case success(AppsGroup)
        case failure(Error)
    }
    
    enum LoadGroup: String {
        case topFree = "top-free"
        case newGames = "new-games-we-love"
        case topGrossing = "top-grossing"
    }
    
    func load(group: LoadGroup, completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/\(group.rawValue)/all/50/explicit.json") else { return }
        
        HTTPClient.get(from: url) { (result: Result<Root, Error>) in
            switch result {
            case let .success(root):
                completion(.success(root.feed))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

private struct Root: Decodable {
    let feed: AppsGroup
}
