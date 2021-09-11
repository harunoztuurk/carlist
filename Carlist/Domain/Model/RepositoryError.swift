//
//  APISessionError.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation

enum RepositoryError: Error {
    case networkError(error: Error, statusCode: Int)
    case invalidJSON
    case noData
}
