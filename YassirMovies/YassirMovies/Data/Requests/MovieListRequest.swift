//
//  MovieListRequest.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 29/08/2023.
//

import Foundation
import YassirNetworking

struct MovieListRequest: URLRequestConvertible {
    
    typealias ResponseModel = MovieEntity
    
    // MARK: - Properties
    
    let httpMethod: HTTPMethod = .get
    
    // MARK: - Methods

    func asURLRequest() -> URLRequest {
        var urlComponents = URLComponents(url: URL(string: "https://api.themoviedb.org/3/discover/movie")!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem]()
        
        let parameters = ["limit": 50]
        
        for(key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents?.queryItems?.append(queryItem)
        }
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie")!)
        request.url = urlComponents?.url
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNWI5YjFhZTgyOGJmNDkwZTM0NGVjZTFjNTM2YzgxNyIsInN1YiI6IjY0ZWQyMWI0ZTg5NGE2MDBlNGU3ZTFlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KUoW6JAkKzKokW5wHJvNZQNniOzR-kzaW9ehjDXLOl0="]
        
        return request
    }
    
}
