//
//  AppsHeaderService.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

final class AppsHeaderService {
    
    enum LoadResult {
        case success([AppsHeaderItem])
        case failure(Error)
    }
    
    func load(completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/appstore/social") else { return }
        
        HTTPClient<[AppsHeaderItem]>().get(from: url) { result in
            switch result {
            case let .success(items):
                completion(.success(items))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
