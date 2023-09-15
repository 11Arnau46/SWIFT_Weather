//
//  ContentView.swift
//  SwiftUI_weather
//
//  Created by Arnau Garcia Martí on 27/6/23.
//

import SwiftUI

struct ContentView: View {
    //Doesn't get destroyed constantly the state in difference to the views
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Valencia, VC")
                MainWeather(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 32)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 28)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 27)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 30)
                    
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:  {
                    ButtonText(tittle: "Change Day Time", textColor: .blue, backgroundColor: .white )
                }
                Spacer()
                
            }

        }
        
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack (){
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .bold, design:.default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height:40)
            Text("\(temperature)ºC")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        
        LinearGradient (gradient: Gradient (colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea (.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design:.default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeather: View{
    var imageName: String
    var temperature: Int
    var body: some View{
        VStack (spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            Text("\(temperature)ºC")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

