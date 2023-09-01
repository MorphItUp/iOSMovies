//
//  MovieDetailsEntity.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

import Foundation

struct MovieDetailsEntity: Codable {
    let id: Int
    let budget: Int
    let genres: [MovieGenreEntity]
    let overview: String
    let posterPath: String
    let revenue: Int
    let runtime: Int
    let title: String
    let voteAverage: Float
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case budget
        case genres
        case overview
        case posterPath = "poster_path"
        case revenue
        case runtime
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieGenreEntity: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
}
