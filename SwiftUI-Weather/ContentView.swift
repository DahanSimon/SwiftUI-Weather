//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Simon Dahan on 12/12/2022.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var isNight = false
    let days: [WeatherDay] = [WeatherDay(dayName: "TUE", temperature: 74, image: "cloud.sun.fill"),
                              WeatherDay(dayName: "WED", temperature: 70, image: "sun.max.fill"),
                              WeatherDay(dayName: "THU", temperature: 55, image: "wind"),
                              WeatherDay(dayName: "FRI", temperature: 60, image: "sunset.fill"),
                              WeatherDay(dayName: "WED", temperature: 55, image: "moon.stars.fill")]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityText(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    ForEach(days) { day in
                        WeatherDayView(day: day.dayName, temperature: day.temperature, imageName: day.image)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var day: String
    var temperature: Int
    var imageName: String
    
    var body: some View {
        VStack {
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
            Image(systemName: imageName)
//                .symbolRenderingMode(.palette)
                .renderingMode(.original)
                .resizable()
//                .foregroundStyle(.pink, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .bold))
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityText: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70.0, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
