//
//  ForecastWeatherAPI.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 10/02/2021.
//

import Foundation

// Use global URL Session

// Calling Forecast Weather API
func getForecastWeather(CompletionHandler: @escaping (ForecastWeather) -> Void){

    let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=\(apiKey)")!
    let forecastTask = session.dataTask(with: url) { data, response, error in
        var forecastWeather: ForecastWeather
        if error != nil || data == nil {
            print("Client error!")
            return
        }
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print("Server error!")
            return
        }
        guard let mime = response.mimeType, mime == "application/json" else {
            print("Wrong MIME type!")
            return
        }
        // Using JSON Decoder
        let decoder = JSONDecoder()
        do {
            forecastWeather = try decoder.decode(ForecastWeather.self, from: data!)
            CompletionHandler(forecastWeather)
        } catch {
            print("JSON error: \(error.localizedDescription)")
        }
    }
    forecastTask.resume()
    
}
 
