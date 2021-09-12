//
//  CarListState.swift
//  Carlist
//
//  Created by Jake Lin on 12/9/21.
//

import Foundation

enum CarListState {
    case loading
    case content(cars: [Car])
    case empty
    case error(error: Error)
}
