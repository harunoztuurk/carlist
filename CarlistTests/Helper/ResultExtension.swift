//
//  Result+Tests.swift
//  CarlistTests
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation

extension Result {
    func getError() -> Failure? {
        switch self {
        case .failure(let failure):
            return failure
        case .success:
            return nil
        }
    }
}
