//
//  Car+Fixture.swift
//  CarlistTests
//
//  Created by Jake Lin on 11/9/21.
//

@testable import Carlist

extension Car {
    static func toyotaCar() -> Car {
        Car(
            id: "001",
            make: CarMake(manufacturer: "Toyota", model: "Corolla"),
            color: "white",
            year: 2010,
            configuration: CarConfiguration(
                body: "Hatcher",
                cylinders: 4,
                horsepower: 4),
            origin: "Japan",
            mpg: 0,
            image: nil,
            price: 10000
        )
    }
}
