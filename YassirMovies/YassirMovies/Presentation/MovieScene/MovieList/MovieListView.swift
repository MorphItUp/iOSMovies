//
//  MovieListView.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import SwiftUI

struct MovieListView<ViewModel: MovieListViewModelProtocol>: View {
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            if let state = viewModel.state {
                contentView(with: state) { movieId in
                    viewModel.didSelectedMovie(id: movieId)
                }
            }
        }
        .navigationTitle("Trending Movies")
        .onAppear(perform: viewModel.configure)
    }
    
    @ViewBuilder
    private func contentView(with state: MovieListState, withAction action: @escaping (Int) -> Void) -> some View {
        switch state {
        case .loading:
            makeLoadingView()
        case .content(let movies):
            makeMovieListView(movies: movies, didSelectMovie: action)
        case .error(let error):
            makeErrorView(model: error)
        }
    }
    
    private func makeLoadingView() -> some View {
        ProgressView()
    }
    
    private func makeErrorView(model: Error) -> some View {
        AlertView(showingAlert: true, message: model.localizedDescription)
    }
    
    private func makeMovieListView(movies: [MovieModel], didSelectMovie: @escaping (Int) -> Void) -> some View {
        List {
            ForEach(movies, id: \.id) { movie in
                Text(movie.title)
                    .onTapGesture {
                        didSelectMovie(movie.id)
                    }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = MovieListRepository()
        let useCase = MovieListUseCase(movieListRepo: repo)
        
        let viewModel = MovieListViewModel(movieListUseCase: useCase)
        MovieListView(viewModel: viewModel)
    }
}
