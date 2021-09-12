//
//  GetCarListSessionSpec.swift
//  CarlistTests
//
//  Created by Jake Lin on 12/9/21.
//

import Foundation
import Nimble
import Quick
import Combine
@testable import Carlist

final class GetCarListSessionSpec: QuickSpec {
    override func spec() {
        describe("an HTTPClient") {
            var request: GetCarListSession!
            var mockAPIProvider: MockAPIProvider!
            let urlString = "https://afterpay-mobile-interview.s3.amazonaws.com/cars.json"
            beforeEach {
                mockAPIProvider = MockAPIProvider()
                request = GetCarListSession(apiProvider: mockAPIProvider)
            }

            context("GIVEN GetCarListSession") {
                describe("WHEN request succeeds") {
                    var result: Result<[Car], APIError>?
                    beforeEach {
                        let urlResponse = HTTPURLResponse(url: URL(string: urlString)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!

                        mockAPIProvider.mockResponse = Just((data: mockData, response: urlResponse))
                            .setFailureType(to: URLError.self)
                            .eraseToAnyPublisher()
                        result = awaitPublisher(request.getCarList())
                    }

                    it("THEN loads data with the request URL") {
                        expect(mockAPIProvider.receivedRequest.url?.absoluteString).to(equal(urlString))
                    }

                    it("THEN completes with success result") {
                        do {
                            let actual = try result?.get()
                            expect(actual).to(equal([Car.toyotaCar, Car.bmwCar]))
                        } catch {
                            fail("carlist should not be nil")
                        }                    }
                }

                context("WHEN request fails") {

                    var expectError: URLError!
                    var result: Result<[Car], APIError>?

                    beforeEach {
                        expectError = URLError(URLError.Code(rawValue: 400))
                        mockAPIProvider.mockResponse = Fail<MockAPIProvider.APIResponse, URLError>(error: expectError)
                            .eraseToAnyPublisher()
                        result = awaitPublisher(request.getCarList())
                    }

                    it("THEN completes with failure result") {
                        let actualError = result?.getError()
                        expect(actualError).to(equal(APIError.networkError(error: expectError, statusCode: 400)))
                    }
                }
            }
        }
    }
}

let mockData =
"""
[
    {
        "id": "b691926d-9b4e-4014-b975-60fa297421e1",
        "make": {
            "manufacturer": "Honda",
            "model": "Civic"
        },
        "color": "Red",
        "year": 2019,
        "configuration": {
            "body": "Saloon",
            "cylinders": 4,
            "horsepower": 130
        },
        "origin": "Japan",
        "mpg": 19,
        "image": "images/honda_civic_1.jpg",
        "price": 17500
    },
    {
        "id": "e55b38f9-c8f0-452f-8e1c-8e005ff706c1",
        "make": {
            "manufacturer": "BMW",
            "model": "X7"
        },
        "color": "Black",
        "year": 2020,
        "configuration": {
            "body": "Coupe",
            "cylinders": 6,
            "horsepower": 240
        },
        "origin": "Germany",
        "mpg": 25,
        "image": "images/bmw_x7_1.jpg",
        "price": 47000
    }
]
""".data(using: .utf8)!
