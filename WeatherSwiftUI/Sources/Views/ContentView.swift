//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 09/07/2020.
//

import SwiftUI
import Combine

struct ContentView: View {
    var weather: Weather
    var colorConfig = ColorConfigurator()
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(
                    primaryColor: colorConfig.primaryColor(for: weather.currently.theme),
                    secondaryColor: colorConfig.tertiaryColor(for: weather.currently.theme),
                    iconName: colorConfig.selectedIconName(for: weather.currently.theme)
                )
                
                VStack {
                    Text("\(summary(weather.daily.data[0].summary))")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    TemperatureView(weather: weather)
                        .padding(10)
                        .frame(alignment: .center)
                    
                    SunPhaseView(weather: weather)
                }
                .padding(30)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    private func summary(_ summary: String) -> String {
        return String(summary.dropLast())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weather: WeatherModel.mockData())
    }
}

extension WeatherModel {
    static func mockData() -> Weather {
        return Weather(latitude: 47.2562463,
                       longitude: -2.0545536,
                       timezone: "Europe/Paris",
                       currently: Currently(time: 1594488541,
                                            summary: "Partly Cloudy",
                                            theme: .clearDay,
                                            temperature: 24,
                                            humidity: 0.4),
                       daily: Daily(summary: "No precipitation throughout the week.",
                                    data: [DailyDatum(time: 1594418400,
                                                      summary: "Clear throughout the day.",
                                                      sunriseTime: 1594441500,
                                                      sunsetTime: 1594497900,
                                                      temperatureMin: 11,
                                                      temperatureMax: 25)]))
    }
}
