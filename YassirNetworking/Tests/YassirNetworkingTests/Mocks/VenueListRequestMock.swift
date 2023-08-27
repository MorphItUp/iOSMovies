//
//  VenueListRequestMock.swift
//  
//
//  Created by Mohamed El Gedawy on 28/08/2023.
//

import Foundation
import YassirNetworking

struct VenueListRequestMock: URLRequestConvertible {
    typealias ResponseModel = EntityMock
    
    // MARK: - Methods
    
    func asURLRequest() -> URLRequest {
      return URLRequest(url: URL(string: "https://api.foursquare.com/v3/places/search")!)
    }
}
