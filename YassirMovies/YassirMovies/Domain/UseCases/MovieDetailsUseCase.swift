//
//  MovieDetailsUseCase.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

import Combine

protocol MovieDetailsUseCaseProtocol {
    func execute(withId movieId: Int) -> AnyPublisher<MovieDetailsModel?, Error>
}

final class MovieDetailsUseCase: MovieDetailsUseCaseProtocol {
    // MARK: - Private Properties
    
    private let movieDetailsRepo: MovieDetailsRepositoryProtocol
    
    // MARK: - Init
    
    init(movieDetailsRepo: MovieDetailsRepositoryProtocol) {
        self.movieDetailsRepo = movieDetailsRepo
    }
    
    // MARK: - Methods
    
    func execute(withId movieId: Int) -> AnyPublisher<MovieDetailsModel?, Error> {
        movieDetailsRepo.getMovieDetails(withId: movieId)
    }
}
