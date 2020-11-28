//
//  HTTPClient.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

class HTTPClient {

    enum Error: Swift.Error {
        case serviceError
        case invalidaData
    }

    static func get<T: Decodable>(from url: URL, completion: @escaping (Result<T, Swift.Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(.failure(Error.serviceError))
                return
            }
            
            guard let receivedDTO = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(Error.invalidaData))
                return
            }
            
            completion(.success(receivedDTO))
            
        }.resume()
    }
}
