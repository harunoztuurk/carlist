//
//  SampleDataCarRepository.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Combine

class SampleDataCarsRepository: CarsRepository {
    func getCars() -> AnyPublisher<[Car], APIError> {
        Just([]).setFailureType(to: APIError.self).eraseToAnyPublisher()
    }
}
