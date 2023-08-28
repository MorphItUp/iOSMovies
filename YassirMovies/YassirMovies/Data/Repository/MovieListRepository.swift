//
//  MovieListRepository.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Foundation
import Combine
import YassirNetworking

class MovieListRepository: MovieListRepositoryProtocol {
    
    // MARK: - Properties
    
    let provider: ServiceProtocol
        
    // MARK: - Init
    
    init(provider: ServiceProtocol = Service()) {
        self.provider = provider
    }
    
    // MARK: - Methods
    
    func getMovieList() -> AnyPublisher<[MovieModel]?, Error> {
        Future<[MovieModel]?, Error> { promise in
            let request = MovieListRequest()
            self.provider.makeRequest(request: request) { result in
                switch result {
                case .success(let response):
                    let movieModel = response.results.map { MovieModel.init(id: $0.id, title: $0.title, overview: $0.overview, poster: $0.poster, releaseDate: $0.releaseDate, voteAverage: $0.voteAverage, voteCount: $0.voteCount) }
                    promise(.success(movieModel))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

