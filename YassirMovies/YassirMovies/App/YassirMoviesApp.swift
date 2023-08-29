//
//  YassirMoviesApp.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 27/08/2023.
//

import SwiftUI

@main
struct YassirMoviesApp: App {
    var body: some Scene {
        let repo = MovieListRepository()
        let useCase = MovieListUseCase(movieListRepo: repo)
        let viewModel = MovieListViewModel(movieListUseCase: useCase)
        WindowGroup {
            MovieListView(viewModel: viewModel)
        }
    }
}
