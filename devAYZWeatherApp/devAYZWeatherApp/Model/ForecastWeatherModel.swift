//
//  ForecastWeatherModel.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 10/02/2021.

import Foundation

// Forecast Weather Model
struct ForecastWeather: Codable {
    let list: [WeatherDetails]
}

struct WeatherDetails: Codable {
    let main: CastMain
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case date = "dt_txt"
    }
}

struct CastMain: Codable {
    let temp: Double

}
