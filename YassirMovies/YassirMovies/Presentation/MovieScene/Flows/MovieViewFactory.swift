//
//  MovieViewFactory.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 01/09/2023.
//

import SwiftUI
import UIKit

protocol MovieViewFactoryProtocol {
    func makeMovieList() -> (UIViewController, MovieListViewModelRouterProtocol)
    func makeMovieDetails(movieId: Int) -> (UIViewController, MovieDetailsViewModelRouterProtocol)
}

class MovieViewFactory: MovieViewFactoryProtocol {
    
    func makeMovieDetails(movieId: Int) ->  (UIViewController, MovieDetailsViewModelRouterProtocol) {
        let repo = MovieDetailsRepository()
        let useCase = MovieDetailsUseCase(movieDetailsRepo: repo, movieId: movieId)
        let viewModel = MovieDetailsViewModel(movieDetailsUseCase: useCase)
        let view = MovieDetailsView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: view)
        return (hostingVC, viewModel)
    }
    
    func makeMovieList() -> (UIViewController, MovieListViewModelRouterProtocol) {
        let repo = MovieListRepository()
        let useCase = MovieListUseCase(movieListRepo: repo)
        let viewModel = MovieListViewModel(movieListUseCase: useCase)
        let view = MovieListView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: view)
        return (hostingVC, viewModel)
    }
}
    
