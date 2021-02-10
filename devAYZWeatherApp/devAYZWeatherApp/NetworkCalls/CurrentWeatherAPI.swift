//
//  API.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 09/02/2021.
//

import Foundation

// Starting URL Session
let session = URLSession.shared
let urlDetails = URLInfo()
let apiKey = urlDetails.apiKey
let city = urlDetails.city

// Calling Current Weather API
func getCurrentWeather(completionHandler: @escaping (CurrentWeather) -> Void){
    
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)")!
    let currentTask = session.dataTask(with: url) { data, response, error in
        var currentW: CurrentWeather
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
            currentW = try decoder.decode(CurrentWeather.self, from: data!)
            completionHandler(currentW)
        } catch {
            print("JSON error: \(error.localizedDescription)")
        }
    }
    currentTask.resume()
}
