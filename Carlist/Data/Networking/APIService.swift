//
//  APIService.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Combine

protocol APIService {
    var url: URL { get }
    var apiProvider: APIProvider { get }

    func request<T: Decodable>() -> AnyPublisher<T, APIError>
}

extension APIService {

    func request<T: Decodable>() -> AnyPublisher<T, APIError> {
        return apiProvider.request(for: URLRequest(url: url))
            .mapError { error in
                .networkError(error: error, statusCode: error.errorCode)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }

    private func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                .invalidJSON(error: error)
            }
            .eraseToAnyPublisher()
    }
}

protocol APIProvider {
    typealias APIResponse = URLSession.DataTaskPublisher.Output
    func request(for request: URLRequest) -> AnyPublisher<APIResponse, URLError>
}

extension URLSession: APIProvider {
    func request(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}
