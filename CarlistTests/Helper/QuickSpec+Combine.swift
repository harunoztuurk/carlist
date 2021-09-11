//
//  QuickSpec+Combine.swift
//  CarlistTests
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
import Quick
import Combine
import Nimble

func awaitPublisher<T: Publisher>(
    _ publisher: T,
    timeout: TimeInterval = 10,
    file: StaticString = #file,
    line: UInt = #line
) -> Result<T.Output, T.Failure>? {
    var result: Result<T.Output, T.Failure>?
    var cancellable: Cancellable!
    waitUntil { done in
        cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                case .finished:
                    break
                }
                done()
            },
            receiveValue: { value in
                result = .success(value)
            }
        )
    }
    cancellable.cancel()
    return result
}
