//
//  Extension.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 10/02/2021.
//

import Foundation

extension ViewController {
    
    func displayCurrentWeatherInfo() {
        getCity() { (weather) in
            DispatchQueue.main.async {
                self.cityName.text = weather.name
                self.day0Description.text = weather.weather[0].description.capitalized
                
                for each in self.day0CurrentReading {
                    each.text =  "\(weather.main.temp.rounded())º"
                }
                if weather.main.temp.rounded() < 15{
                    self.setWeatherToRainy()
                }
                self.day0MinReading.text = "\(weather.main.tempMin.rounded())º"
                self.day0MaxReading.text = "\(weather.main.tempMax.rounded())º"
            }
        }
    }
    
    func setSunnyWeatherUI() {
        downView.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.6705882353, blue: 0.1843137255, alpha: 1)
        upView.image = #imageLiteral(resourceName: "forest_sunny")
        for i in weatherSign {
            i.image = #imageLiteral(resourceName: "clear")
        }
    }
    func setCloudyWeatherUI() {
        downView.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.4431372549, blue: 0.4784313725, alpha: 1)
        upView.image = #imageLiteral(resourceName: "forest_cloudy")
        for i in weatherSign {
            i.image = #imageLiteral(resourceName: "partlySunny")
        }
    }
    func setWeatherToRainy() {
        downView.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3647058824, alpha: 1)
        upView.image = #imageLiteral(resourceName: "forest_rainy")
        for i in weatherSign {
            i.image = #imageLiteral(resourceName: "rain")
        }
    }
    
}
