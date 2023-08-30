//
//  MovieDetailsRequest.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 30/08/2023.
//

import Foundation
import YassirNetworking

struct MovieDetailsRequest: URLRequestConvertible {
    
    typealias ResponseModel = MovieDetailsEntity
    
    // MARK: - Properties
    
    let httpMethod: HTTPMethod = .get
    var movieId: Int
    
    // MARK: - Init
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    // MARK: - Methods
    
    func asURLRequest() -> URLRequest {
        var urlComponents = URLComponents(url: URL(string: "https://api.themoviedb.org/3/movie/\(movieId)")!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem]()
        
        let parameters = ["language": "en-US"]
        
        for(key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents?.queryItems?.append(queryItem)
        }
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie")!)
        request.url = urlComponents?.url
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNWI5YjFhZTgyOGJmNDkwZTM0NGVjZTFjNTM2YzgxNyIsInN1YiI6IjY0ZWQyMWI0ZTg5NGE2MDBlNGU3ZTFlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KUoW6JAkKzKokW5wHJvNZQNniOzR-kzaW9ehjDXLOl0"]
        
        return request
    }
    
}
