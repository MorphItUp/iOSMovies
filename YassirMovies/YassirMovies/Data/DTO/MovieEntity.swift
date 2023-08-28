//
//  MovieEntity.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Foundation

// MARK: - MovieEntity

struct MovieEntity: Codable {
    
    let results: [MovieResultEntity]
    
    init(results: [MovieResultEntity] = []) {
        self.results = results
    }
}
