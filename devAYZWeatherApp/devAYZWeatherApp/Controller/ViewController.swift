//
//  ViewController.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 28/01/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // all outlet
    @IBOutlet weak var upView: UIImageView!
    @IBOutlet weak var downView: UIView!
    
    @IBOutlet open weak var cityName: UILabel!
    @IBOutlet var day0CurrentReading: [UILabel]!
    @IBOutlet weak var day0Description: UILabel!
    @IBOutlet weak var day0MinReading: UILabel!
    @IBOutlet weak var day0MaxReading: UILabel!
    
    @IBOutlet var weatherSign: [UIImageView]!

    @IBOutlet weak var day1: UILabel!
    
    @IBOutlet var groupDay1Reading: [UILabel]!
    @IBOutlet var groupDay2Reading: [UILabel]!
    @IBOutlet var groupDay3Reading: [UILabel]!
    
    // satting  user default storage
    let userDefault = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCity() { (weather) in
            DispatchQueue.main.async {
                self.cityName.text = weather.name
                for each in self.day0CurrentReading {
                    each.text =  "\(weather.main.temp.rounded())º"
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
    func setRainWeatherUI() {
        downView.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3647058824, alpha: 1)
        upView.image = #imageLiteral(resourceName: "forest_rainy")
        for i in weatherSign {
            i.image = #imageLiteral(resourceName: "rain")
            
        }
    }
    
    
    
    
}

