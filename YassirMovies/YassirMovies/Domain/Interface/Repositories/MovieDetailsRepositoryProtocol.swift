//
//  MovieDetailsRepositoryProtocol.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

import Combine

protocol MovieDetailsRepositoryProtocol {
    func getMovieDetails(withId movieId: Int) -> AnyPublisher<MovieDetailsModel?, Error>
}
