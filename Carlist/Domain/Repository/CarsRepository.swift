//
//  CarsRepository.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Combine

protocol CarsRepository {
    func getCars() -> AnyPublisher<[Car], RepositoryError>
}
