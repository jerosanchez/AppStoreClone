//
//  AppsLoadResult.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

struct AppsLoadResult: Decodable {
    let title: String
    let results: [AppsLoadResultItem]
}

struct AppsLoadResultItem: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}
