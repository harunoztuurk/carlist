//
//  CarListSceneDIContainer.swift
//  Carlist
//
//  Created by Jake Lin on 12/9/21.
//

import Foundation

final class CarListSceneDIContainer {

    lazy var getCarListSession: GetCarListSessionType = GetCarListSession()

    // MARK: - Use Cases
    func makeGetCarListUseCase() -> GetCarListUserCaseType {
        GetCarListUserCase(carsRepository: makeCarsRepository())
    }

    // MARK: - Repositories
    func makeCarsRepository() -> CarsRepository {
        return SampleDataCarsRepository(getCarListSession: getCarListSession)
    }


    // MARK: - Movies List
    func makeCarListViewController() -> CarListViewController {
        CarListViewController(viewModel: makeCarListViewModel())
    }

    func makeCarListViewModel() -> CarListViewModel {
        CarListViewModel(getCarListUserCase: makeGetCarListUseCase())
    }
}

