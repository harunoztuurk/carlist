//
//  Car+Fixture.swift
//  CarlistTests
//
//  Created by Jake Lin on 11/9/21.
//

@testable import Carlist

extension Car {
    static let toyotaCar = Car(
        id: "b691926d-9b4e-4014-b975-60fa297421e1",
        make: CarMake(manufacturer: "Honda", model: "Civic"),
        color: "Red",
        year: 2019,
        configuration: CarConfiguration(
            body: "Saloon",
            cylinders: 4,
            horsepower: 130),
        origin: "Japan",
        mpg: 19,
        image: "images/honda_civic_1.jpg",
        price: 17500
    )

    static let bmwCar = Car(
        id: "e55b38f9-c8f0-452f-8e1c-8e005ff706c1",
        make: CarMake(manufacturer: "BMW", model: "X7"),
        color: "Black",
        year: 2020,
        configuration: CarConfiguration(
            body: "Coupe",
            cylinders: 6,
            horsepower: 240),
        origin: "Germany",
        mpg: 25,
        image: "images/bmw_x7_1.jpg",
        price: 47000
    )
}
