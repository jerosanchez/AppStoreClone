//
//  AppsHeaderItem.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 28/11/20.
//

import Foundation

struct AppsHeaderItem: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let tagline: String
}
