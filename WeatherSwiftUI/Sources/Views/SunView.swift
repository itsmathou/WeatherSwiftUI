//
//  SunView.swift
//  WeatherSwiftUI
//
//  Created by Mathilde Ferrand on 12/07/2020.
//

import SwiftUI

struct SunView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("clementine"))
            
            Circle()
                .foregroundColor(Color("sunny"))
                .frame(width: 320, height: 325, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Circle()
                .foregroundColor(Color("beige"))
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView()
    }
}
