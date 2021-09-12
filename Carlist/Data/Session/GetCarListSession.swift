//
//  GetCarListSession.swift
//  Carlist
//
//  Created by Jake Lin on 12/9/21.
//

import Foundation
import Combine

protocol GetCarListSessionType {
    func getCarList() -> AnyPublisher<[Car], APIError>
}

struct GetCarListSession: GetCarListSessionType {

    let apiProvider: APIProvider

    init(apiProvider: APIProvider = URLSession.shared) {
        self.apiProvider = apiProvider
    }

    struct Request: APIService {
        let apiProvider: APIProvider
        var urlComponents: URLComponents

        init(apiProvider: APIProvider) {
            self.apiProvider = apiProvider
            self.urlComponents = URLComponents()
            urlComponents.scheme = API.scheme
            urlComponents.host = API.host
            urlComponents.path = "/cars.json"
        }

        var url: URL {
            urlComponents.url!
        }
    }

    func getCarList() -> AnyPublisher<[Car], APIError> {
        return Request(apiProvider: apiProvider).request()
    }
}
