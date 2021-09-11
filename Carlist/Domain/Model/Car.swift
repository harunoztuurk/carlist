//
//  Car.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation

struct Car {
    let id: String
    let make: CarMake
    let color: String
    let year: Int
    let configuration: CarConfiguration
    let origin: String?
    let mpg: Int?
    let image: String?
    let price: Int
}

struct CarMake {
    let manufacturer: String
    let model: String
}

struct CarConfiguration {
    let body: String
    let cylinders: Int?
    let horsepower: Int?
}
