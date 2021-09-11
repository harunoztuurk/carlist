//
//  GetCarListUserCase.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Combine

protocol GetCarListUserCaseType {
    func getCarList() -> AnyPublisher<[Car], APIError>
}

final class GetCarListUserCase: GetCarListUserCaseType {

    let carsRepository: CarsRepository

    init(carsRepository: CarsRepository) {
        self.carsRepository = carsRepository
    }

    func getCarList() -> AnyPublisher<[Car], APIError> {
        carsRepository.getCars()
    }
}

