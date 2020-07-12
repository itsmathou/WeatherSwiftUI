//
//  SunPhaseView.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 12/07/2020.
//

import SwiftUI

struct SunPhaseView: View {
    var weather: Weather
    
    var body: some View {
        HStack {
            VStack {
                Text("Sunrise: \(date(from: weather.daily.data[0].sunriseTime))")
                Text("Sunset: \(date(from: weather.daily.data[0].sunsetTime))")
            }.padding(.trailing, 20)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 8.0)
                    .foregroundColor(.white)
                    .opacity(0.3)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Circle()
                    .trim(from: 0.0, to: percentageSunLeft())
                    .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color("clementine"))
                    .opacity(0.5)
                    .rotationEffect(Angle(degrees: 270), anchor: .center)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text("\(sunLeft(from: weather.currently.time, toSunset: weather.daily.data[0].sunsetTime))")
            }
        }
    }
    
    private func date(from timeInterval: Double) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    private func sunLeft(from currently: Double, toSunset: Double) -> String {
        let currently = Date(timeIntervalSince1970: currently)
        let sunset = Date(timeIntervalSince1970: toSunset)
        let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: currently, to: sunset)
        
        var diff: String = ""
        if let hours = diffComponents.hour, let minutes = diffComponents.minute {
            if minutes < 10 {
                diff = "\(hours)h0\(minutes)"
            } else {
                diff = "\(hours)h\(minutes)"
            }
        } else {
            diff = "Data unavailable"
        }
        
        return diff
    }
    
    private func percentageSunLeft() -> CGFloat {
        let currentTime = Date(timeIntervalSince1970: weather.currently.time)
        let sunriseTime = Date(timeIntervalSince1970: weather.daily.data[0].sunriseTime)
        let sunsetTime = Date(timeIntervalSince1970: weather.daily.data[0].sunsetTime)
        let diffFullDay = Calendar.current.dateComponents([.second], from: sunriseTime, to: sunsetTime)
        let diffCurrent = Calendar.current.dateComponents([.second], from: currentTime, to: sunsetTime)
        
        var percentage: CGFloat = 0.0
        if let diffCurrent = diffCurrent.second, let diffFullDay = diffFullDay.second {
            percentage = ((100 * CGFloat(diffCurrent)) / CGFloat(diffFullDay)) / 100
        } else {
            percentage = 0.0
        }
        
        return percentage
    }
}


struct SunPhaseView_Previews: PreviewProvider {
    static var previews: some View {
        SunPhaseView(weather: WeatherModel.mockData())
    }
}
