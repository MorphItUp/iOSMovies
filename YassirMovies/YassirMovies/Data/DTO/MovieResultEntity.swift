//
//  MovieResultEntity.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Foundation

struct MovieResultEntity: Codable {
    var id: String
    var title: String
    var overview: String
    var poster: String
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case poster = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
