//
//  WeatherModel.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 09/07/2020.
//

import Combine
import Foundation

final class WeatherModel: ObservableObject {
    let networkingClient: Networking = Networking()
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var weather: Weather? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.darksky.net/forecast/\(DarkSky.key)/47.2562463,-2.0545536?units=ca") else { return }
        
        networkingClient.fetch(url)
            .sink { completion in
                if case .failure(let error) = completion,
                   let apiError = error as? APIError {
                    dump(apiError)
                }
            } receiveValue: { (model: Weather) in
                self.weather = model
            }.store(in: &cancellables)
    }
}
