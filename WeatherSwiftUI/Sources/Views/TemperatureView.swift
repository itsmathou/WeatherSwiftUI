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
            HStack {
                Image(systemName: "arrowtriangle.down.fill")
                Text("\(rounded(temperature: weather.daily.data[0].temperatureMin))")
            }
            .padding(5)
            
            Text("\(rounded(temperature: weather.currently.temperature))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(10)
                .padding(.bottom, 30)
            
            HStack {
                Image(systemName: "arrowtriangle.up.fill")
                Text("\(rounded(temperature: weather.daily.data[0].temperatureMax))")
            }
            .padding(5)
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
