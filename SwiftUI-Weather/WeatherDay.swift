//
//  WeatherDay.swift
//  SwiftUI-Weather
//
//  Created by Simon Dahan on 12/12/2022.
//

import Foundation

struct WeatherDay: Identifiable {
    let dayName: String
    let temperature: Int
    let image: String
    var id: String { dayName }
}
