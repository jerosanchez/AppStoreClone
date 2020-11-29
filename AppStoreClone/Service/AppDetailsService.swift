//
//  AppDetailsService.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import Foundation

final class AppDetailsService {
    typealias LoadResult = Result<AppDetails, Error>
    
    func load(appId: String, completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/lookup?id=\(appId)") else { return }
        
        HTTPClient.get(from: url) { (result: Result<Root, Error>) in
            switch result {
            case let .success(root):
                if let appDetails = root.results.first {
                    completion(.success(appDetails))
                } else {
                    completion(.failure(HTTPClient.Error.invalidaData))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

private struct Root: Decodable {
    let resultCount: Int
    let results: [AppDetails]
}
