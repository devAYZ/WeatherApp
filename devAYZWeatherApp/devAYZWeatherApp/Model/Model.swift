//
//  Model.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 09/02/2021.
//

import Foundation

// Current Weather Model
struct CurrentWeather: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp, tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}


// Forecast Weather Model
struct ForecastWeather: Codable {
    let list: [WeatherDetails]
}

struct WeatherDetails: Codable {
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case date = "dt_txt"
    }
}

