//
//  TemperatureView.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 12/07/2020.
//

import SwiftUI

struct TemperatureView: View {
    var weather: Weather
    
    var body: some View {
        HStack {
            Text("Min: \(rounded(temperature: weather.daily.data[0].temperatureMin))")
            Text("Currently: \(rounded(temperature: weather.currently.temperature))")
            Text("Max: \(rounded(temperature: weather.daily.data[0].temperatureMax))")
        }
    }
    
    private func rounded(temperature: Double) -> Int {
        return Int(temperature)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(weather: WeatherModel.mockData())
    }
}
