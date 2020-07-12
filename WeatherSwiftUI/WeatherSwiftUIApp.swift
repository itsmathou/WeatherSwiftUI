//
//  WeatherSwiftUIApp.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 09/07/2020.
//

import SwiftUI

@main
struct WeatherSwiftUIApp: App {
    @StateObject var weatherModel = WeatherModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(weather: weatherModel.weather ?? WeatherPlaceholder.data)
        }
    }
}
