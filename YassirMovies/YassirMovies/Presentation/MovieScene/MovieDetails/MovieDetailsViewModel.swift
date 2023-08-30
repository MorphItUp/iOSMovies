//
//  MovieDetailsViewModel.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

import Combine

final class MovieDetailsViewModel: ObservableObject {
    
    // MARK: - Private Properties
    
    private var subscriptions = Set<AnyCancellable>()
    private let movieDetailsUseCase: MovieDetailsUseCaseProtocol
    
    let errorMessageSubject = CurrentValueSubject<String, Never>("Unknown error occured")
    let errorSubject = PassthroughSubject<Void, Never>()
    @Published var movieDetails: MovieDetailsModel?
    
    // MARK: - Init
    
    init(movieDetailsUseCase: MovieDetailsUseCaseProtocol) {
        self.movieDetailsUseCase = movieDetailsUseCase
    }
    
    // MARK: - Requests
    
    func requestMovieDetails(withId movieId: Int) {
        movieDetailsUseCase.execute(withId: movieId)
            .sink { [weak self] error in
                guard let self else { return }
                switch error {
                case .finished:
                    break
                case .failure:
                    self.errorSubject.send()
                    self.errorMessageSubject.send("Unknown error occured")
                }
            } receiveValue: { [weak self] movieDetails in
                guard let self,
                      let movieDetails else { return }
                self.movieDetails = movieDetails
            }
            .store(in: &subscriptions)
    }
}
