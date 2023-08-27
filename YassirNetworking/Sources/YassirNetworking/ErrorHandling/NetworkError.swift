//
//  NetworkError.swift
//  
//
//  Created by Mohamed El Gedawy on 28/08/2023.
//

import Foundation

public enum ServiceError: Int, Error {
    case unknown = 0
    case decoding
    case requestCreation
    case noInternetConnection = -1009
    case badURL = -1000
}

// MARK: - Custom Init

extension ServiceError {
    init(withError error: Error) {
        let error = error as NSError
        self = Self(rawValue: error.code) ?? .unknown
    }
}
