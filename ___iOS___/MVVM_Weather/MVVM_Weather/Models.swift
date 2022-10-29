//
//  Models.swift
//  MVVM_Weather
//
//  Created by fabiocunha on 29/12/21.
//

import Foundation

// Data

struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
}
