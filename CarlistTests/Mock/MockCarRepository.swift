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

    var publisher: AnyPublisher<[Car], RepositoryError>!

    init() {}
    
    func getCars() -> AnyPublisher<[Car], RepositoryError> {
        publisher
    }
}
