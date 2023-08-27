//
//  URLSessionMock.swift
//  
//
//  Created by Mohamed El Gedawy on 28/08/2023.
//

import Foundation
import YassirNetworking

class URLSessionMock: URLSessionProtocol {
    
    // MARK: - Properties
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    // MARK: - Methods
    
    func dataTask<Request>(
        with convertable: Request,
        completion: @escaping DataTaskResult
    ) -> URLSessionDataTaskProtocol where Request : URLRequestConvertible {
        completion(data, response, error)
        
        return URLSession.shared.dataTask(
            with: URLRequest(url: URL(string: "www.google.com")!),
            completionHandler: { _, _, _ in}
        )
    }
}
