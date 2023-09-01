//
//  MovieListRequestMock.swift
//  
//
//  Created by Mohamed El Gedawy on 28/08/2023.
//

import Foundation
import YassirNetworking

struct MovieListRequestMock: URLRequestConvertible {
    typealias ResponseModel = EntityMock
    
    // MARK: - Methods
    
    func asURLRequest() -> URLRequest {
      return URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie")!)
    }
}
