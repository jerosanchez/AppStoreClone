//
//  AppsGroupService.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

enum AppsGroupToLoad: String {
    case topFree = "top-free"
    case newGames = "new-games-we-love"
    case topGrossing = "top-grossing"
}

final class AppsGroupService {
    
    enum LoadResult {
        case success(AppsGroup)
        case failure(Error)
    }
    
    func load(group: AppsGroupToLoad, completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/\(group.rawValue)/all/50/explicit.json") else { return }
        
        HTTPClient<Root>().get(from: url) { result in
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
