//
//  MockCarRepository.swift
//  CarlistTests
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Combine
@testable import Carlist

class MockCarRepository: CarsRepository {

    var publisher: AnyPublisher<[Car], APIError>!

    init() {}
    
    func getCars() -> AnyPublisher<[Car], APIError> {
        publisher
    }
}
