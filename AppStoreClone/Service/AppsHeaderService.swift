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
    
    enum LoadResultError: Error {
        case serviceError
        case invalidaData
    }
    
    func load(completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/appstore/social") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(.failure(LoadResultError.serviceError))
                return
            }
            
            guard let receivedDTO = try? JSONDecoder().decode([AppsHeaderItem].self, from: data) else {
                completion(.failure(LoadResultError.invalidaData))
                return
            }
            
            completion(.success(receivedDTO))
            
        }.resume()
    }
}
