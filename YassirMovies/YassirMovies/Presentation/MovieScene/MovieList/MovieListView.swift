//
//  MovieListView.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        
        Text("HELLOOO")
        
        List {
            ForEach(viewModel.movies, id: \.id) { movie in
                Text(movie.title)
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
