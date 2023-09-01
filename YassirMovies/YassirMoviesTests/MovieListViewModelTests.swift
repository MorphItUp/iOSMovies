//
//  MovieListViewModelTests.swift
//  YassirMoviesTests
//
//  Created by Mohamed El Gedawy on 01/09/2023.
//

import Foundation
import XCTest
import Combine
@testable import YassirMovies

final class MovieListViewModelTests: XCTestCase {
    
    var sut: MovieListViewModel!
    var movieListUseCaseMock: MovieListUseCaseMock!
    var bag: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        movieListUseCaseMock = MovieListUseCaseMock()
        bag = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        movieListUseCaseMock = nil
        sut = nil
        bag = nil
        super.tearDown()
    }
    
    func test_requestMovieList_failure() {
        let expectation = expectation(description: "requestMovieList_failure")
        
        // Given
        movieListUseCaseMock.error = NSError(domain: "backend", code: 100)
        sut = MovieListViewModel(movieListUseCase: movieListUseCaseMock)
        
        // When
        sut.configure()
        sut.$state.sink { state in
            switch state {
            case .error(let error):
                expectation.fulfill()
                XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (backend error 100.)")
            default:
                break
            }
        }
        .store(in: &bag)
        
        // Then
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_requestMovieList_success() {
        let expectation = expectation(description: "requestMovieList_success")
        
        // Given
        let model = [MovieModel.init(
            id: 10,
            title: "TestTitle",
            overview: "TestOverview",
            poster: "TestPoster",
            releaseDate: "TestReleaseDate",
            voteAverage: 2.0,
            voteCount: 15)
        ]
        movieListUseCaseMock.model = model
        sut = MovieListViewModel(movieListUseCase: movieListUseCaseMock)
        
        // When
        sut.configure()
        sut.$state.sink { state in
            switch state {
            case .content(let movies):
                expectation.fulfill()
                XCTAssertEqual(movies, model)
            default:
                break
            }
        }
        .store(in: &bag)
        
        // Then
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_requestMovieList_loading() {
        let expectation = expectation(description: "requestMovieList_loading")
        
        // Given
        sut = MovieListViewModel(movieListUseCase: movieListUseCaseMock)
        
        // When
        sut.$state.sink { state in
            switch state {
            case .loading:
                expectation.fulfill()
            default:
                break
            }
        }
        .store(in: &bag)
        
        // Then
        wait(for: [expectation], timeout: 0.1)
    }
}
