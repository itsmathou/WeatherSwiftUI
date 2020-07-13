//
//  WeatherModelResponse.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 09/07/2020.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
    let daily: Daily
}

// MARK: - Currently
struct Currently: Codable {
    let time: Double
    let summary: String
    let theme: Theme
    let temperature, humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case time, temperature, humidity, summary
        case theme = "icon"
    }
}

// MARK: - Daily
struct Daily: Codable {
    let summary: String
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Double
    let summary: String
    let sunriseTime, sunsetTime: Double
    let temperatureMin: Double
    let temperatureMax: Double
}

struct Theme: RawRepresentable, Codable, Hashable {
    let rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let cloudy = Theme(rawValue: "cloudy")
    static let partlyCloudyDay = Theme(rawValue: "partly-cloudy-day")
    static let partlyCloudyNight = Theme(rawValue: "partly-cloudy-night")
    static let clearDay = Theme(rawValue: "clear-day")
    static let clearNight = Theme(rawValue: "clear-night")
    static let rain = Theme(rawValue: "rain")
    static let snow = Theme(rawValue: "snow")
    static let sleet = Theme(rawValue: "sleet")
    static let wind = Theme(rawValue: "wind")
    static let fog = Theme(rawValue: "fog")
}
