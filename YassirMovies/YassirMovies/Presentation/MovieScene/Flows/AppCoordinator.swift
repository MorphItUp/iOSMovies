//
//  AppCoordinator.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 01/09/2023.
//

import UIKit
import SwiftUI

class AppCoordinator {
    
    // MARK: - Properties
    let navigationController: UINavigationController
    let movieViewFactory: MovieViewFactoryProtocol
    
    // MARK: - Init
 
    init(navigationController: UINavigationController,
         movieViewFactory: MovieViewFactoryProtocol) {
        self.navigationController = navigationController
        self.movieViewFactory = movieViewFactory
    }
    
    convenience init(navigationController: UINavigationController) {
        self.init(navigationController: navigationController, movieViewFactory: MovieViewFactory())
    }
    
    // MARK: - Methods
    
    func start() {
        var (view, viewModel) = movieViewFactory.makeMovieList()
        viewModel.selectedMovieHandler = { [weak self] movieId in
            guard let self else { return }
            self.navigateToMovieDetails(withId: movieId)
        }
        navigationController.pushViewController(view, animated: true)
    }
    
    func navigateToMovieDetails(withId movieId: Int) {
        let (view, _) = movieViewFactory.makeMovieDetails(movieId: movieId)
        navigationController.pushViewController(view, animated: true)
    }
    
}
