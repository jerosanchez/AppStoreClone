//
//  AppsHeaderService.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

final class AppsHeaderService {
    typealias LoadResult = Result<[AppsHeaderItem], Error>
    
    func load(completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/appstore/social") else { return }
        
        HTTPClient.get(from: url, completion: completion)
    }
}
