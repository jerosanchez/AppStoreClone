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
                        content: $0.content.label,
                        author: $0.author.name.label,
                        rating: Int($0.rating.label) ?? 0)
                }
                completion(.success(reviews))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

private struct Root: Decodable {
    let feed: Feed
}

private struct Feed: Decodable {
    let entry: [Entry]
}

private struct Entry: Decodable {
    let title: Label
    let content: Label
    let author: Author
    let rating: Label
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
        case author
        case rating = "im:rating"
    }
}

private struct Author: Decodable {
    let name: Label
}

private struct Label: Decodable {
    let label: String
}
