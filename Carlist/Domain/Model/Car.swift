//
//  Car.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation

public struct Car: Decodable {
    public let id: String
    public let make: CarMake
    public let color: String
    public let year: Int
    public let configuration: CarConfiguration
    public let origin: String?
    public let mpg: Int?
    public let image: String?
    public let price: Int
}

public struct CarMake: Decodable {
    public let manufacturer: String
    public let model: String
}

public struct CarConfiguration: Decodable {
    public let body: String
    public let cylinders: Int?
    public let horsepower: Int?
}
