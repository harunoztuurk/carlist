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

    let publisher = PassthroughSubject<[Car], RepositoryError>()

    func getCars() -> AnyPublisher<[Car], RepositoryError> {
        publisher
            .eraseToAnyPublisher()
    }
}
