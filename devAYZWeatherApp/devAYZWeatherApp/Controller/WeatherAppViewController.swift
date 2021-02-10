//
//  ViewController.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 28/01/2021.
//

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

    @IBOutlet weak var day1: UILabel!
    
    @IBOutlet var groupDay1Reading: [UILabel]!
    @IBOutlet var groupDay2Reading: [UILabel]!
    @IBOutlet var groupDay3Reading: [UILabel]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayCurrentWeatherInfo()
        
        displayForecastWeatherInfo()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
