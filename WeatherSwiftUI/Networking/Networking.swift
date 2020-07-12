//
//  Networking.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 09/07/2020.
//

import Combine
import Foundation

struct APIError: Decodable, Error {
    let code: Int
    let error: String
}

final class Networking {
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                let decoder = JSONDecoder()
                guard let urlResponse = result.response as? HTTPURLResponse, (200...299).contains(urlResponse.statusCode) else {
                    let apiError = try decoder.decode(APIError.self, from: result.data)
                    throw apiError
                }
                return try decoder.decode(T.self, from: result.data)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
