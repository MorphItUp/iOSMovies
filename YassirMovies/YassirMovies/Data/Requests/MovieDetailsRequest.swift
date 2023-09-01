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
    
    private let httpMethod: HTTPMethod = .get
    private var movieId: Int
    
    // MARK: - Init
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    // MARK: - Methods
    
    func asURLRequest() -> URLRequest {
        var urlComponents = URLComponents(url: URL(string: NetworkConstants.baseUrl.rawValue + "/movie/\(movieId)")!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem]()
        
        let parameters = ["language": "en-US"]
        
        for(key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents?.queryItems?.append(queryItem)
        }
        
        var request = URLRequest(url: URL(string: NetworkConstants.baseUrl.rawValue + "/movie")!)
        request.url = urlComponents?.url
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = ["Authorization": NetworkConstants.token.rawValue]
        return request
    }
    
}
