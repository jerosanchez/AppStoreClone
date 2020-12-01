//
//  AppReviewsService.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 1/12/20.
//

import Foundation

final class AppReviewsService {
    typealias LoadResult = Result<[AppReview], Error>
    
    func load(appId: String, completion: @escaping (LoadResult) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/us/rss/customerreviews/id=\(appId)/mostrecent/json") else { return }
        
        HTTPClient.get(from: url) { (result: Result<Root, Error>) in
            switch result {
            case let .success(root):
                let reviews = root.feed.entry.map {
                    return AppReview(
                        title: $0.title.label,
                        content: $0.content.label)
                }
                completion(.success(reviews))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

struct AppReview {
    let title: String
    let content: String
}

private struct Root: Decodable {
    let feed: Feed
}

private struct Feed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let title: Label
    let content: Label
}

struct Label: Decodable {
    let label: String
}
