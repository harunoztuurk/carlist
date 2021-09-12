//
//  CarListViewModel.swift
//  Carlist
//
//  Created by Jake Lin on 12/9/21.
//

import Foundation
import Combine

class CarListViewModel {

    let state: PassthroughSubject<CarListState, APIError> = PassthroughSubject()
    let getCarListUserCase: GetCarListUserCaseType
    private var disposables = Set<AnyCancellable>()

    init(getCarListUserCase: GetCarListUserCaseType) {
        self.getCarListUserCase = getCarListUserCase
    }

    func startLoading() {
        state.send(.loading)
        getCarListUserCase.getCarList()
            .sink(
              receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    self.state.send(.error(error: error))
                case .finished:
                  break
                }
              },
              receiveValue: { [weak self] cars in
                if cars.isEmpty {
                    self?.state.send(.empty)
                } else {
                    self?.state.send(.content(cars: cars))
                }
            })
            .store(in: &disposables)
    }
}
