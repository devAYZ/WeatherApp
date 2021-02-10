//
//  ViewController.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 28/01/2021.

import UIKit

class WeatherAppViewController: UIViewController, UITextFieldDelegate {
    // all outlet
    @IBOutlet weak var weatherConditionImage: UIImageView!
    @IBOutlet weak var weatherConditionColor: UIView!
    
    @IBOutlet open weak var currentCityName: UILabel!
    @IBOutlet var currentCityTemp: [UILabel]!
    @IBOutlet weak var currentCityTempDescription: UILabel!
    @IBOutlet weak var currentCityMinTemp: UILabel!
    @IBOutlet weak var currentCityMaxTemp: UILabel!
    
    @IBOutlet var currentCityWeatherIcon: [UIImageView]!

    
    @IBOutlet weak var dayOne: UILabel!
    @IBOutlet weak var dayTwo: UILabel!
    @IBOutlet weak var dayThree: UILabel!
    @IBOutlet weak var dayFour: UILabel!
    @IBOutlet weak var dayFive: UILabel!
    @IBOutlet weak var daySix: UILabel!
    
    
    @IBOutlet weak var dayOneeForecastTemp: UILabel!
    @IBOutlet weak var dayTwoForecastTemp: UILabel!
    @IBOutlet weak var dayThreeForecastTemp: UILabel!
    @IBOutlet weak var dayFourForecastTemp: UILabel!
    @IBOutlet weak var dayFiveForecastTemp: UILabel!
    @IBOutlet weak var daySixForecastTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayCurrentWeatherInfo()
        
        displayForecastWeatherInfo()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
