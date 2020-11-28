//
//  AppsGroup.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

struct AppsGroup: Decodable {
    let title: String
    let results: [AppsGroupItem]
}

struct AppsGroupItem: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}
