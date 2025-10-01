//
//  NetworkingService.swift
//  Goldspar
//
//  Created by Michael Campbell on 10/1/25.
//

import Foundation

class NetworkService {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard var urlComponents = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: true) else {
            throw NetworkError.invalidURL
        }

        if let parameters = endpoint.parameters, endpoint.method == .get {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        }

        guard let url = urlComponents.url else { throw NetworkError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        if let parameters = endpoint.parameters, endpoint.method != .get {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }

        switch httpResponse.statusCode {
        case 200..<300:
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys  // Change setting depending how the backend is setup
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError(error)
            }
        case 400..<500:
            throw NetworkError.clientError(httpResponse.statusCode)
        case 500..<600:
            throw NetworkError.serverError(httpResponse.statusCode)
        default:
            throw NetworkError.unknown
        }
    }
}
