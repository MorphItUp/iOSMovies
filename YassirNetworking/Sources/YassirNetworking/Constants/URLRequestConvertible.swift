//
//  URLRequestConvertible.swift
//  
//
//  Created by Mohamed El Gedawy on 28/08/2023.
//

import Foundation

// MARK: - URLRequestConvertible Protocol

public protocol URLRequestConvertible {
    associatedtype ResponseModel: Decodable
    func asURLRequest() -> URLRequest
}


