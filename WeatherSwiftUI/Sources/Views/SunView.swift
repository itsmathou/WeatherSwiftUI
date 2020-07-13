//
//  SunView.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 12/07/2020.
//

import SwiftUI

struct SunView: View {
    var theme: Theme
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(primaryColor(for: theme))
            
            Circle()
                .foregroundColor(secondaryColor(for: theme))
                .frame(width: 320, height: 325, alignment: .center)
            
            Circle()
                .foregroundColor(tertiaryColor(for: theme))
                .frame(width: 200, height: 200, alignment: .center)
        }
    }
    
    private func primaryColor(for theme: Theme) -> Color {
        switch theme {
        case .clearDay, .partlyCloudyDay:
            return Color("clementine")
        case .cloudy, .rain, .snow, .sleet, .wind, .fog:
            return Color("taupe")
        case .clearNight, .partlyCloudyNight:
            return Color("nightSky")
        default:
            return Color("clementine")
        }
    }
    
    private func secondaryColor(for theme: Theme) -> Color {
        switch theme {
        case .clearDay, .partlyCloudyDay:
            return Color("sunny")
        case .cloudy, .rain, .snow, .sleet, .wind, .fog:
            return Color("sand")
        case .clearNight, .partlyCloudyNight:
            return Color("dawn")
        default:
            return Color("sunny")
        }
    }
    
    private func tertiaryColor(for theme: Theme) -> Color {
        switch theme {
        case .clearDay, .partlyCloudyDay:
            return Color("beige")
        case .cloudy, .rain, .snow, .sleet, .wind, .fog:
            return Color("lightGrey")
        case .clearNight, .partlyCloudyNight:
            return Color("notPink")
        default:
            return Color("beige")
        }
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView(theme: Theme(rawValue: "clear-day"))
    }
}
