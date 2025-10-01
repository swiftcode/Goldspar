//
//  UserEndpoint.swift
//  Goldspar
//
//  Created by Michael Campbell on 10/1/25.
//

import Foundation

enum UserEndpoint: Endpoint {
    case getUsers
    case createUser(name: String, email: String)

    var baseURL: URL {
        return URL(string: "https://api.example.com")!
    }

    var path: String {
        switch self {
        case .getUsers, .createUser:
            return "/users"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        case .createUser:
            return .post
        }
    }

    var headers: [String: String]? {
        return ["Authorization": "Bearer AUTH_TOKEN"]
    }

    var parameters: [String: Any]? {
        switch self {
        case .getUsers:
            return nil
        case .createUser(let name, let email):
            return ["name": name, "email": email]
        }
    }
}
