//
//  WeatherAppViewControllerExtensionForForecastWeather.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 10/02/2021.

import Foundation

extension WeatherAppViewController {
    
    // Using Forecast Weather Data
    func displayForecastWeatherInfo() {
        getForecastWeather() { (forecastWeather) in
            DispatchQueue.main.async {
                var eachDate = forecastWeather.list[0].date
                self.dayOne.text = self.getDayFromDate(eachDate)!
                self.dayOneeForecastTemp.text = "\(forecastWeather.list[0].main.temp.rounded())º"
                var count = 2
                for i in 1...36 {
                    if self.getDayFromDate(eachDate)! != self.getDayFromDate(forecastWeather.list[i].date)! {
                        eachDate = forecastWeather.list[i].date
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
                            self.dayFour.text = day
                            self.dayFourForecastTemp.text =  "\(forecastWeather.list[i].main.temp.rounded())º"
                            count += 1
                        }
                        else if count == 5 {
                            self.dayFive.text = day
                            self.dayFiveForecastTemp.text = "\(forecastWeather.list[i].main.temp.rounded())º"
                            count += 1
                        }
                        else {
                            self.daySix.text = day
                            self.daySixForecastTemp.text = "\(forecastWeather.list[i].main.temp.rounded())º"
                        }
                        
                    }
                }
            }
            
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
