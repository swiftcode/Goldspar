//
//  NetworkError.swift
//  Goldspar
//
//  Created by Michael Campbell on 10/1/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case clientError(Int)
    case serverError(Int)
    case decodingError(Error)
    case unknown
}
