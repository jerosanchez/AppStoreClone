//
//  AppDetails.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 29/11/20.
//

import Foundation

struct AppDetails: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
