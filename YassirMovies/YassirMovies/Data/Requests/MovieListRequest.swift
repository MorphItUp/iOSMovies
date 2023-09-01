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
    
    private let httpMethod: HTTPMethod = .get
    
    // MARK: - Methods

    func asURLRequest() -> URLRequest {
        var urlComponents = URLComponents(url: URL(string: NetworkConstants.baseUrl.rawValue + "/discover/movie")!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem]()
        
        let parameters = ["limit": 50]
        
        for(key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents?.queryItems?.append(queryItem)
        }
        
        var request = URLRequest(url: URL(string: NetworkConstants.baseUrl.rawValue + "/discover/movie")!)
        request.url = urlComponents?.url
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = ["Authorization": NetworkConstants.token.rawValue]
        return request
    }
    
}
