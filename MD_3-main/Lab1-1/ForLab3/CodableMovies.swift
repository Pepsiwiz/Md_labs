//
//  CodableMovies.swift
//  Lab1-1
//
//  Created by Andrew Kurovskiy on 25.04.2021.
//

struct Movies: Codable {
    struct Movie: Codable {
        var title: String
        var year: String
        var imdbID: String
        var type: String
        var poster: String
        
        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID = "imdbID"
            case type = "Type"
            case poster = "Poster"
        }
    }
    var Search: [Movie]
}
