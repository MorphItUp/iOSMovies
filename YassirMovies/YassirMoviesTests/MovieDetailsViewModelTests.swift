//
//  MovieDetailsViewModelTests.swift
//  YassirMoviesTests
//
//  Created by Mohamed El Gedawy on 01/09/2023.
//

import Foundation
import XCTest
import Combine
@testable import YassirMovies

final class MovieDetailsViewModelTests: XCTestCase {

    var sut: MovieDetailsViewModel!
    var movieDetailsUseCase: MovieDetailsUseCaseMock!
    var bag: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        movieDetailsUseCase = MovieDetailsUseCaseMock()
        sut = MovieDetailsViewModel(movieDetailsUseCase: movieDetailsUseCase)
        bag = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        movieDetailsUseCase = nil
        sut = nil
        bag = nil
        super.tearDown()
    }
    
    func test_requestMovieList_failure() {
        let expectation = expectation(description: "requestMovieDetails_failure")
        
        // Given
        movieDetailsUseCase.error = NSError(domain: "backend", code: 100)
        sut = MovieDetailsViewModel(movieDetailsUseCase: movieDetailsUseCase)
        
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
        let expectation = expectation(description: "requestMovieDetails_success")
        
        // Given
        let model = MovieDetailsModel.init(id: 10,
                                           budget: 1,
                                           genres: [],
                                           overview: "TestOverview",
                                           posterPath: "TestPoster",
                                           revenue: 123,
                                           runtime: 123,
                                           title: "TestTitle",
                                           voteAverage: 6.6,
                                           voteCount: 123)
        
        movieDetailsUseCase.model = model
        sut = MovieDetailsViewModel(movieDetailsUseCase: movieDetailsUseCase)
        
        // When
        sut.configure()
        sut.$state.sink { state in
            switch state {
            case .content(let movie):
                expectation.fulfill()
                XCTAssertEqual(movie.title, model.title)
            default:
                break
            }
        }
        .store(in: &bag)
        
        // Then
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_requestMovieList_loading() {
        let expectation = expectation(description: "requestMovieDetails_loading")
        
        // Given
        sut = MovieDetailsViewModel(movieDetailsUseCase: movieDetailsUseCase)
        
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
