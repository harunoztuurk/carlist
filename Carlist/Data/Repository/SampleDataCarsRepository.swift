//
//  SampleDataCarRepository.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Combine

class SampleDataCarsRepository: CarsRepository {

    let getCarListSession: GetCarListSessionType

    init(getCarListSession: GetCarListSessionType = GetCarListSession()) {
        self.getCarListSession = getCarListSession
    }

    func getCars() -> AnyPublisher<[Car], APIError> {
        getCarListSession.getCarList()
    }
}
