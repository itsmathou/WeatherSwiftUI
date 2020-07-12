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
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("sunnyDayBlue"))
                .edgesIgnoringSafeArea(.all)
            
            SunView()
                .padding(.top, -900)
            
            VStack {
                Text("St Père en Retz")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                TemperatureView(weather: weather)
                    .padding(.bottom, 20)
                
                SunPhaseView(weather: weather)
            }
        }
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
                                            icon: "partly-cloudy-day",
                                            temperature: 24,
                                            humidity: 0.4),
                       daily: Daily(summary: "No precipitation throughout the week.", icon: "clear-day", data: [DailyDatum(time: 1594418400, summary: "Clear throughout the day.", icon: "clear-day", sunriseTime: 1594441500, sunsetTime: 1594497900, temperatureMin: 11, temperatureMax: 25)]))
    }
}
