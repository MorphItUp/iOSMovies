//
//  MovieListUseCaseMock.swift
//  YassirMoviesTests
//
//  Created by Mohamed El Gedawy on 31/08/2023.
//

import Foundation
import Combine
@testable import YassirMovies

final class MovieListUseCaseMock: MovieListUseCaseProtocol {
   
    // MARK: - Properties
    
    var error: Error?
    var model: [MovieModel]?
    var movieListReturnValue: Future<[MovieModel]?, Error> {
        Future<[MovieModel]?, Error>.init { promise in
            if let error = self.error {
                promise(.failure(error))
            } else if let model = self.model {
                promise(.success(model))
            }
        }
    }
    
    func execute() -> AnyPublisher<[YassirMovies.MovieModel]?, Error> {
        movieListReturnValue.eraseToAnyPublisher()
    }
}
