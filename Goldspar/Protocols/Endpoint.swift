//
//  Endpoint.swift
//  Goldspar
//
//  Created by Michael Campbell on 10/1/25.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
