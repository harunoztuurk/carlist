//
//  MockURLSession.swift
//  CarlistTests
//
//  Created by Jake Lin on 12/9/21.
//

import Foundation
import Combine
@testable import Carlist

class MockAPIProvider: APIProvider {

    var receivedRequest: URLRequest!
    var mockResponse: AnyPublisher<APIResponse, URLError>!
    
    func request(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        self.receivedRequest = request
        return mockResponse
    }
}
