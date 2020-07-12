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
    let icon: String
    let temperature, humidity: Double
}

//enum Icon: String, Codable {
//    case cloudy = "cloudy"
//    case partlyCloudyDay = "partly-cloudy-day"
//    case partlyCloudyNight = "partly-cloudy-night"
//    case clearDay = "clear-day"
//    case clearNight = "clear-night"
//    case rain = "rain"
//    case snow = "snow"
//    case
//}

//enum Summary: String, Codable {
//    case mostlyCloudy = "Mostly Cloudy"
//    case overcast = "Overcast"
//    case partlyCloudy = "Partly Cloudy"
////    clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night
//}

// MARK: - Daily
struct Daily: Codable {
    let summary, icon: String
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Double
    let summary, icon: String
    let sunriseTime, sunsetTime: Double
    let temperatureMin: Double
    let temperatureMax: Double
}

