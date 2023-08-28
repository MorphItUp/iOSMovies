//
//  MovieListUseCase.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Combine

// MARK: - MovieList UseCase

protocol MovieListUseCaseProtocol {
    func execute() -> AnyPublisher<[MovieModel]?, Error>
}

final class MovieListUseCase: MovieListUseCaseProtocol {
    
    // MARK: - Private Properties
    
    private let movieListRepo: MovieListRepositoryProtocol
    
    // MARK: - Init
    
    init(movieListRepo: MovieListRepositoryProtocol) {
        self.movieListRepo = movieListRepo
    }
    
    // MARK: - Methods
    
    func execute() -> AnyPublisher<[MovieModel]?, Error> {
        movieListRepo.getMovieList()
    }
    
}
