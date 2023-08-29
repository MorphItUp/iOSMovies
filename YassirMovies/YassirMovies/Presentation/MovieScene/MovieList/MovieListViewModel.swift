//
//  MovieListViewModel.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Combine

final class MovieListViewModel: ObservableObject {
    
    // MARK: - Private Properties
    
    private var subscriptions = Set<AnyCancellable>()
    private let movieListUseCase: MovieListUseCaseProtocol
    
    let errorMessageSubject = CurrentValueSubject<String, Never>("Unknown error occured")
    let errorSubject = PassthroughSubject<Void, Never>()
    @Published var movies: [MovieModel] = []
    
    // MARK: - Init
    
    init(movieListUseCase: MovieListUseCaseProtocol) {
        self.movieListUseCase = movieListUseCase
        self.requestMovieList()
    }
    
    // MARK: - Requests
    
    func requestMovieList() {
        movieListUseCase.execute()
            .sink { [weak self] error in
                guard let self else { return }
                switch error {
                case .finished:
                    break
                case .failure:
                    self.errorSubject.send()
                    self.errorMessageSubject.send("Unknown error occured")
                }
            } receiveValue: { [weak self] movies in
                guard let self,
                      let movies else { return }
                self.movies = movies
            }
            .store(in: &subscriptions)
    }
}
