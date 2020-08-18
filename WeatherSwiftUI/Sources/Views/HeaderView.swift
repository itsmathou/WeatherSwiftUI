//
//  HeaderView.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 18/08/2020.
//

import SwiftUI

struct HeaderView: View {
    var primaryColor: Color
    var secondaryColor: Color
    var iconName: String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [primaryColor, secondaryColor]),
                           startPoint: .top,
                           endPoint: .trailing)
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            VStack {
                HStack {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.leading, 20)
                        .foregroundColor(.white)
                        .opacity(0.5)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                Text("St Père en Retz")
                    .font(.largeTitle)
                    .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(primaryColor: Color("nightSky"), secondaryColor: Color("notPink"), iconName: "moon")
    }
}
