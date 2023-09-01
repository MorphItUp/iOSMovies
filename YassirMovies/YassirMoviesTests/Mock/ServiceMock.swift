//
//  ServiceMock.swift
//  YassirMoviesTests
//
//  Created by Mohamed El Gedawy on 31/08/2023.
//

import Foundation
import YassirNetworking

class ServiceMock: ServiceProtocol {
    
    // MARK: - Properties
    
    var error: ServiceError?
    var model: Codable?
    
    func makeRequest<Request>(
        request: Request,
        completion: @escaping ServiceCompletion<Request.ResponseModel>) where Request: URLRequestConvertible
    {
        if let error = error {
            completion(.failure(error))
        } else if let model = model {
            completion(.success(model as! Request.ResponseModel))
        }
    }
    
}
