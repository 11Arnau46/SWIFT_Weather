//
//  WeatherButton.swift
//  SwiftUI_weather
//
//  Created by Arnau Garcia Martí on 30/6/23.
//

import SwiftUI
struct ButtonText: View{
    var tittle: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(tittle)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
            .font(.system(size: 20, weight: .bold, design: .default))
    }
}
