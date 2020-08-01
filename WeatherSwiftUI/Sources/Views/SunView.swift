//
//  SunView.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 12/07/2020.
//

import SwiftUI

struct SunView: View {
    var theme: Theme
    var colorConfig: ColorConfigurator
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(colorConfig.primaryColor(for: theme))
            
            Circle()
                .foregroundColor(colorConfig.secondaryColor(for: theme))
                .frame(width: 320, height: 320, alignment: .center)
            
            Circle()
                .foregroundColor(colorConfig.tertiaryColor(for: theme))
                .frame(width: 210, height: 210, alignment: .center)
        }
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView(theme: .clearDay, colorConfig: ColorConfigurator())
    }
}
