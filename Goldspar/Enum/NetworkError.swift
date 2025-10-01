//
//  NetworkError.swift
//  Goldspar
//
//  Created by Michael Campbell on 10/1/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case clientError(Int)
    case serverError(Int)
    case decodingError(Error)
    case unknown
    
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return "Invalid URL"
            case .invalidResponse:
                return "Invalid Response"
            case .clientError(let error):
                return "Client Error (\(error))"
            case .serverError(let error):
                return "Server Error (\(error))"
            case .decodingError(let error):
                return "Decoding Error: \(error)"
            case .unknown:
                return "Unknown error occured"
        }
    }
}
