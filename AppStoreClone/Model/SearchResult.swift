//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [SearchResultItem]
}

struct SearchResultItem: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
}
