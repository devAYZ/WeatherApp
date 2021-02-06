//
//  ViewController.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 28/01/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var upView: UIImageView!
    @IBOutlet weak var downView: UIView!
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet var day0CurrentReading: [UILabel]!
    @IBOutlet weak var day0Description: UILabel!
    @IBOutlet weak var day0MinReading: UILabel!
    @IBOutlet weak var day0MaxReading: UILabel!
    
    
    @IBOutlet var weatherSign: [UIImageView]!
    
    @IBOutlet weak var day1: UILabel!
    
    @IBOutlet var groupDay1Reading: [UILabel]!
    @IBOutlet var groupDay2Reading: [UILabel]!
    @IBOutlet var groupDay3Reading: [UILabel]!
    
    let userDefault = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCity()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setCloudyWeatherUI()
//        setSunnyWeatherUI()
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
    
    
    func getCity(){
        
        let session = URLSession.shared
        let apiKey = "dd10034da157e85bdf281551787a4afa"
        let city = "London" // London Lagos Ikere-Ekiti Akure
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
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
            
            do {
                
                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                
                if let cityName = (jsonResult["name"] as? String){
                    DispatchQueue.main.async {
                        self.cityName.text = cityName
                        
                    }
                    
                }
                
                if let weatherData = (jsonResult["weather"] as? Array<[String:Any]>){
                    DispatchQueue.main.async {
                        self.day0Description.text = weatherData[0]["description"]! as? String
                        self.day0Description.text = self.day0Description.text?.capitalized
                    }
                    
                }
                
                if let mainValues = (jsonResult["main"] as? NSDictionary),
                   let temp = mainValues["temp"] as? Double,
                   let maxTemp = mainValues["temp_max"] as? Double,
                   let minTemp = mainValues["temp_min"] as? Double {
                    
                    DispatchQueue.main.async {
                        for i in self.day0CurrentReading {
                            i.text =  "\(ceil(temp))ºC"
                        }
                        self.day0MinReading.text = "\(minTemp.rounded())º"
                        self.day0MaxReading.text = "\(maxTemp.rounded())º"
                        
                        if temp <= 15 {
                            self.setRainWeatherUI()
                        } else if temp >= 25{
                            self.setSunnyWeatherUI()
                        } else {
                            self.setCloudyWeatherUI()
                        }
                        
                        // days
                        for i in self.groupDay1Reading {
                            i.text = "\(minTemp.rounded())º"
                        }
                        for i in self.groupDay2Reading {
                            i.text = "\(temp.rounded())º"
                        }
                        for i in self.groupDay3Reading {
                            i.text = "\(maxTemp.rounded())º"
                        }
                        
                    }
                }
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
}

