//
//  ServiceTests.swift
//  
//
//  Created by Mohamed El Gedawy on 28/08/2023.
//

import Foundation
import XCTest

@testable import YassirNetworking

class ServiceTests: XCTestCase {
    
    var sut: Service!
    var urlSessionMock: URLSessionMock!
    
    override func setUp() {
        super.setUp()
        urlSessionMock = URLSessionMock()
        sut = Service(session: urlSessionMock)
    }
    
    override func tearDown() {
        sut = nil
        urlSessionMock = nil
        super.tearDown()
    }
    
    func testMakeRequest_backendFailure() {
        urlSessionMock.error = NSError(domain: "backend", code: 100)
        let request = MovieListRequestMock()
        let expectation = expectation(description: "makeRequest_backendFailure")
        
        sut.makeRequest(request: request) { result in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertEqual(error, ServiceError.unknown)
            case .success:
                break
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func testMakeRequest_decodingError() {
        urlSessionMock.error = nil
        urlSessionMock.data = Data()
        let request = MovieListRequestMock()
        let expectation = expectation(description: "makeRequest_decodingError")
        
        sut.makeRequest(request: request) { result in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertEqual(error, ServiceError.decoding)
            case .success:
                break
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func testMakeRequest_success() {
        let entityMock = EntityMock(name: "TestEntity")
        let dataMock = try? JSONEncoder().encode(entityMock)
        urlSessionMock.data = dataMock
        
        let request = MovieListRequestMock()
        let expectation = expectation(description: "makeRequest_success")
        
        sut.makeRequest(request: request) { result in
            switch result {
            case .failure:
                break
            case .success(let response):
                expectation.fulfill()
                XCTAssertEqual(response, entityMock)
            }
        }
        wait(for: [expectation], timeout: 3)
        
    }
    
}
