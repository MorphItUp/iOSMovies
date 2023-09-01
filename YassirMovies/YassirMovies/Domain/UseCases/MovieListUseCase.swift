//
//  MovieListUseCase.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

// In real life application, this class would contain more business logic
import Combine

// MARK: - MovieList UseCases

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
