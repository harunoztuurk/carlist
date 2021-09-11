//
//  GetCarListUserCaseSpec.swift
//  CarlistTests
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Quick
import Nimble
import Combine
@testable import Carlist

final class GetCarListUserCaseSpec: QuickSpec {
    override func spec() {
        var testSubject: GetCarListUserCase!
        var carsRepistory: MockCarRepository!

        context("Given GetCarListUserCase") {
            beforeEach {
                carsRepistory = MockCarRepository()
                testSubject =  GetCarListUserCase(carsRepository: carsRepistory)
            }

            describe("When repository return an list of cars") {
                var result: Result<[Car], RepositoryError>?
                beforeEach {
                    let car = Car.toyotaCar()
                    carsRepistory.publisher = Just([car])
                        .setFailureType(to: RepositoryError.self)
                        .eraseToAnyPublisher()
                    result = awaitPublisher(testSubject.getCarList())
                }

                it("Then get a list of car") {
                    do {
                        let actual = try result?.get()
                        expect(actual).to(equal([Car.toyotaCar()]))
                    } catch {
                        fail("carlist should not be nil")
                    }
                }
            }

            describe("When repository return no data error") {
                var result: Result<[Car], RepositoryError>?
                beforeEach {
                    carsRepistory.publisher = Fail<[Car], RepositoryError>(error: RepositoryError.noData)
                        .eraseToAnyPublisher()
                    result = awaitPublisher(testSubject.getCarList())
                }

                it("Then get no data error") {
                    let actualError = result?.getError()
                    expect(actualError).to(equal(RepositoryError.noData))
                }
            }
        }
    }
}
