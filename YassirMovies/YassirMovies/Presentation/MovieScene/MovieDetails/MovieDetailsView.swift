//
//  MovieDetailsView.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

import SwiftUI

struct MovieDetailsView<ViewModel: MovieDetailsViewModelProtocol>: View {
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        contentView(with: viewModel.state ?? .loading)
            .onAppear(perform: viewModel.configure)
    }
    
    @ViewBuilder
    private func contentView(with state: MovieDetailsState) -> some View {
        switch state {
        case .loading:
            makeLoadingView()
        case .content(let movie):
            makeMovieDetailsView(movie: movie)
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
    
    private func makeMovieDetailsView(movie: MovieDetailsModel) -> some View {
        ScrollView {
            VStack(spacing: 10) {
                AsyncImage(url: URL(string: "http://image.tmdb.org/t/p/w780/" + movie.posterPath), scale: 2.2)
                    .cornerRadius(20)
                    .scaledToFit()
                    .frame(alignment: .top)
                    .shadow(radius: 25)
                    .padding()
                Spacer()
                Text(movie.title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(5)
                
                Text(movie.overview)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(5)
                    .font(.callout)
            }
        }
   }
}


struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = MovieDetailsRepository()
        let useCase = MovieDetailsUseCase(movieDetailsRepo: repo, movieId: 12)
        let viewModel = MovieDetailsViewModel(movieDetailsUseCase: useCase)
        MovieDetailsView(viewModel: viewModel)
    }
}
