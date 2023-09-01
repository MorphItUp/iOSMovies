//
//  MovieDetailsUseCaseMock.swift
//  YassirMoviesTests
//
//  Created by Mohamed El Gedawy on 01/09/2023.
//

import Foundation
import Combine
@testable import YassirMovies


final class MovieDetailsUseCaseMock: MovieDetailsUseCaseProtocol {
    
    // MARK: - Properties

    var error: Error?
    var model: MovieDetailsModel?
    var movieId: Int = 0
    
    var movieListReturnValue: Future<MovieDetailsModel?, Error> {
        Future<MovieDetailsModel?, Error>.init { promise in
            if let error = self.error {
                promise(.failure(error))
            } else if let model = self.model {
                promise(.success(model))
            }
        }
    }
    
    func execute() -> AnyPublisher<YassirMovies.MovieDetailsModel?, Error> {
        movieListReturnValue.eraseToAnyPublisher()
    }
}
