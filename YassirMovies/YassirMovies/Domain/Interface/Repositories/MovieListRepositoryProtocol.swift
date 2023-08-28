//
//  MovieListRepositoryProtocol.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Combine

protocol MovieListRepositoryProtocol {
    func getMovieList() -> AnyPublisher<[MovieModel]?, Error>
}
