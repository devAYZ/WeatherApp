//
//  Extension.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 10/02/2021.

import Foundation

extension WeatherAppViewController {
    
    func displayCurrentWeatherInfo() {
        
        // Set User Default
        let defaults = UserDefaults.standard
        defaults.set("Lagos", forKey: "Name")
        currentCityName.text = defaults.string(forKey: "Name")
        
        // Using Current Weather Data
        getCurrentWeather() { [weak self] (weather) in
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
    
    // Using Forecast Weather Data
    func displayForecastWeatherInfo() {
        getForecastWeather() { (forecastWeather) in
            DispatchQueue.main.async {
                var eachDate = forecastWeather.list[0].date
//                self.forecastWeatherDays[0].text = self.getDayFromDate(eachDate)!
                self.dayOne.text = self.getDayFromDate(eachDate)!
                self.dayOneeForecastTemp.text = "\(forecastWeather.list[0].main.temp.rounded())º"
                print(forecastWeather.list[0].main.temp.rounded())
                var count = 2
                for i in 1...36 {
                    if self.getDayFromDate(eachDate)! != self.getDayFromDate(forecastWeather.list[i].date)! {
                        eachDate = forecastWeather.list[i].date
                        print(self.getDayFromDate(eachDate)!)
                        //forecasttW.list[i].main.temp
                        let day = self.getDayFromDate(forecastWeather.list[i].date)!
                        let temp = "\(forecastWeather.list[i].main.temp.rounded())º"
                        
                        if count == 2 {
                            self.dayTwo.text = day
                            self.dayTwoForecastTemp.text = temp
                            count += 1
                        }
                        else if count == 3 {
                            self.dayThree.text = day
                            self.dayThreeForecastTemp.text = temp
                            count += 1
                        }
                        else if count == 4 {
                            self.dayFourForecastTemp.text = "\(forecastWeather.list[i].main.temp.rounded())º"
                            count += 1
                        }
                        else if count == 5 {
                            self.dayFiveForecastTemp.text = "\(forecastWeather.list[i].main.temp.rounded())º"
                            count += 1
                        }
                        else {
                            self.daySixForecastTemp.text = "\(forecastWeather.list[i].main.temp.rounded())º"
//                            count += 1
                        }
                        
                    }
                }
            }

        }
    }
    
    // UI Weather Features
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
    
    func getDayFromDate(_ date: String) -> String? {
        
        var day = ""
        let daysOfTheWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let todayDate = formatter.date(from: date) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        
        let identifier = weekDay - 1
        for _ in daysOfTheWeek {
            day = daysOfTheWeek[identifier]
        }
        return day
    }
}
