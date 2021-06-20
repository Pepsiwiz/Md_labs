//
//  CodablePhotos.swift
//  Lab1-1
//
//  Created by Andrew Kurovskiy on 07.05.2021.
//

import Foundation

struct Photo: Codable {
    var id: Int
    var pageURL: String
    var type: String
    var tags: String
    var previewURL: String
    var previewWidth: Int
    var previewHeight: Int
    var webformatURL: String
    var webformatWidth: Int
    var webformatHeight: Int
    var largeImageURL: String
    var imageWidth: Int
    var imageHeight: Int
    var imageSize: Int
    var views: Int
    var downloads: Int
    var favorites: Int
    var likes: Int
    var comments: Int
    var user_id: Int
    var user: String
    var userImageURL: String
    
    
}

struct Photos: Codable {
    var total: Int
    var totalHits: Int
    var hits: [Photo]
}

