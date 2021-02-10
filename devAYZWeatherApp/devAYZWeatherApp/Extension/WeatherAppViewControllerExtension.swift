//
//  Extension.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 10/02/2021.
//

import Foundation

extension WeatherAppViewController {
    
    func displayCurrentWeatherInfo() {
        getCity() { [weak self] (weather) in
            DispatchQueue.main.async {
                self?.currentCityName.text = weather.name
                self?.currentCityTempDescription.text = weather.weather[0].description.capitalized
                let currentTemp = weather.main.temp.rounded()
                for each in self!.currentCityTemp {
                    each.text =  "\(currentTemp)º"
                }
                if currentTemp < 14 {
                    self?.setUIWeatherConditionToRainy()
                } else if currentTemp > 24 {
                    self?.setUIWeatherConditionToSunny()
                } else {
                    self?.setUIWeatherConditionToCloudy()
                }
                self?.currentCityMinTemp.text = "\(weather.main.tempMin.rounded())º"
                self?.currentCityMaxTemp.text = "\(weather.main.tempMax.rounded())º"
            }
        }
    }
    
    func setUIWeatherConditionToSunny() {
        weatherConditionColor.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.6705882353, blue: 0.1843137255, alpha: 1)
        weatherConditionImage.image = #imageLiteral(resourceName: "forest_sunny")
        for i in currentCityWeatherIcon {
            i.image = #imageLiteral(resourceName: "clear")
        }
    }
    
    func setUIWeatherConditionToCloudy() {
        weatherConditionColor.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.4431372549, blue: 0.4784313725, alpha: 1)
        weatherConditionImage.image = #imageLiteral(resourceName: "forest_cloudy")
        for i in currentCityWeatherIcon {
            i.image = #imageLiteral(resourceName: "partlySunny")
        }
    }
    
    func setUIWeatherConditionToRainy() {
        weatherConditionColor.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3647058824, alpha: 1)
        weatherConditionImage.image = #imageLiteral(resourceName: "forest_rainy")
        for i in currentCityWeatherIcon {
            i.image = #imageLiteral(resourceName: "rain")
        }
    }
}
