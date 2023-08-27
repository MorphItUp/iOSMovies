//
//  URLSessionProtocol.swift
//  
//
//  Created by Mohamed El Gedawy on 28/08/2023.
//

import Foundation

// MARK: - URLSession Protocol

public protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTask<Request: URLRequestConvertible>(
        with convertable: Request,
        completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

// MARK: - URLSession DataTask Protocol

public protocol URLSessionDataTaskProtocol {
    func resumeTask()
}

// MARK: - URLSession DataTask Extension

extension URLSessionDataTask: URLSessionDataTaskProtocol {
    public func resumeTask() {
        resume()
    }
}

// MARK: - URLSession Extension

extension URLSession: URLSessionProtocol {
    public func dataTask<Request>(
        with convertable: Request,
        completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol where Request : URLRequestConvertible {
        return dataTask(
            with: convertable.asURLRequest(),
            completionHandler: completion
        )
    }
}

