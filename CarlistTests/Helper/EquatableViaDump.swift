//
//  File.swift
//  CarlistTests
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation
@testable import Carlist

public protocol EquatableViaDump: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool
}

public extension EquatableViaDump {
    static func == (lhs: Self, rhs: Self) -> Bool {
        var ldump = ""
        var rdump = ""
        dump(lhs, to: &ldump)
        dump(rhs, to: &rdump)
        return ldump == rdump
    }
}


extension RepositoryError: EquatableViaDump {}
extension Car: EquatableViaDump {}
