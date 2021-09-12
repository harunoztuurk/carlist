//
//  CarListViewModel.swift
//  Carlist
//
//  Created by Jake Lin on 12/9/21.
//

import Foundation

class CarListViewModel {

    let getCarListUserCase: GetCarListUserCaseType

    init(getCarListUserCase: GetCarListUserCaseType) {
        self.getCarListUserCase = getCarListUserCase
    }
}
