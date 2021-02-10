//
//  ViewController.swift
//  devAYZWeatherApp
//
//  Created by Ayokunle on 28/01/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
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
        displayCurrentWeatherInfo()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
