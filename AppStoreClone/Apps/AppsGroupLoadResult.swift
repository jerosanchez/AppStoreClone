//
//  AppsGroupLoadResult.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

struct AppsGroupLoadResult: Decodable {
    let title: String
    let results: [AppsGroupLoadResultItem]
}

struct AppsGroupLoadResultItem: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}
