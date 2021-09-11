//
//  APISessionError.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import Foundation

public enum APIError: Error {
    case networkError(error: Error, statusCode: Int)
    case invalidJSON(error: Error)
    case noData
}
