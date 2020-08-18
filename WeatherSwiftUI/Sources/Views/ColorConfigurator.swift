//
//  ColorConfigurator.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 01/08/2020.
//

import SwiftUI

struct ColorConfigurator {
    func backgroundColor(for theme: Theme) -> Color {
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
    
    func primaryColor(for theme: Theme) -> Color {
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
    
    func secondaryColor(for theme: Theme) -> Color {
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
    
    func tertiaryColor(for theme: Theme) -> Color {
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
    
    func selectedIconName(for theme: Theme) -> String {
        switch theme {
        case .clearDay:
            return "sun.max"
        case .partlyCloudyDay:
            return "cloud.sun"
        case .cloudy:
            return "cloud"
        case .rain:
            return "cloud"
        case .snow:
            return "snow"
        case .sleet:
            return "cloud.sleet"
        case .wind:
            return "wind"
        case .fog:
            return "cloud.fog"
        case .clearNight:
            return "moon"
        case .partlyCloudyNight:
            return "cloud.moon"
        default: return ""
        }
    }
}
