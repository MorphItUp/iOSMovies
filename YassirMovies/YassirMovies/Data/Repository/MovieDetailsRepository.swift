//
//  MovieDetailsRepository.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

import Combine
import YassirNetworking

protocol MovieDetailsRepositoryProtocol {
    func getMovieDetails(withId movieId: Int) -> AnyPublisher<MovieDetailsModel?, Error>
}

final class MovieDetailsRepository: MovieDetailsRepositoryProtocol {
    
    // MARK: - Properties
    
    private let provider: ServiceProtocol
        
    // MARK: - Init
    
    init(provider: ServiceProtocol = Service()) {
        self.provider = provider
    }
    
    // MARK: - Methods
    
    func getMovieDetails(withId movieId: Int) -> AnyPublisher<MovieDetailsModel?, Error> {
        Future<MovieDetailsModel?, Error> { promise in
            let request = MovieDetailsRequest(movieId: movieId)
            self.provider.makeRequest(request: request) { result in
                switch result {
                case .success(let response):
                    let movieDetailsModel = MovieDetailsModel.init(movieDetailsEntity: response)
                    promise(.success(movieDetailsModel))
                case .failure(let error):
                    promise(.failure(error))
                    
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
}
