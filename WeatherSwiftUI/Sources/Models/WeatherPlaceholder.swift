//
//  WeatherPlaceholder.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 11/07/2020.
//

import Foundation

struct WeatherPlaceholder {
    static let data = Weather(latitude: 0,
                              longitude: 0,
                              timezone: "European/Paris",
                              currently: Currently(time: Date().timeIntervalSince1970,
                                                   summary: "Loading",
                                                   theme: Theme(rawValue: "clear-day"),
                                                   temperature: 0,
                                                   humidity: 0),
                              daily: Daily(summary: "Loading",
                                           data: [DailyDatum(time: Date().timeIntervalSince1970,
                                                             summary: "Loading",
                                                             sunriseTime: Date().timeIntervalSince1970,
                                                             sunsetTime: Date().timeIntervalSince1970,
                                                             temperatureMin: 0,
                                                             temperatureMax: 0)]))
}
