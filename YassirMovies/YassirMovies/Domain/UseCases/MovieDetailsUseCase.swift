//
//  MovieDetailsUseCase.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

// In real life application, this class would contain more business logic
import Combine

// MARK: - MovieDetails UseCases

protocol MovieDetailsUseCaseProtocol {
    func execute() -> AnyPublisher<MovieDetailsModel?, Error>
    var movieId: Int { get set }
}

final class MovieDetailsUseCase: MovieDetailsUseCaseProtocol {
    
    // MARK: - Private Properties
    
    private let movieDetailsRepo: MovieDetailsRepositoryProtocol
    var movieId: Int
    
    // MARK: - Init
    
    init(movieDetailsRepo: MovieDetailsRepositoryProtocol, movieId: Int) {
        self.movieDetailsRepo = movieDetailsRepo
        self.movieId = movieId
    }
    
    // MARK: - Methods
    
    func execute() -> AnyPublisher<MovieDetailsModel?, Error> {
        movieDetailsRepo.getMovieDetails(withId: movieId)
    }
}
