//
//  MovieModel.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Foundation

struct MovieModel: Equatable {
    var id: Int
    var title: String
    var overview: String
    var poster: String
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int
}
