//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 15/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView = MainView()
    var weatherManager = WeatherManager()
    
    var isSunny: Bool = true
    
    var conditionImageView: UIImageView!
    var temperatureLabel: UILabel!
    var cityLabel: UILabel!
    var searchTextField: UITextField!
    var currentLocationBtn: UIButton!
    var searchButton: UIButton!
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        conditionImageView = mainView.getImageView()
        temperatureLabel = mainView.getTemperatureLabel()
        cityLabel = mainView.getCityLabel()
        searchTextField = mainView.getSearchTextField()
        currentLocationBtn = mainView.getLocationButton()
        searchButton = mainView.getSearchButton()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        searchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func cloudyColor(){
        isSunny = false
        view.backgroundColor = UIColor(named: "backgroundCloudy")
        conditionImageView.tintColor = UIColor(named: "primaryCloudy")
        currentLocationBtn.configuration?.baseBackgroundColor = UIColor(named: "accentCloudy")
        searchButton.configuration?.baseBackgroundColor = UIColor(named: "accentCloudy")
    }
    
    func sunnyColor(){
        isSunny = true
        view.backgroundColor = UIColor(named: "backgroundSunny")
        conditionImageView.tintColor = UIColor(named: "primarySunny")
        currentLocationBtn.configuration?.baseBackgroundColor = UIColor(named: "accentSunny")
        searchButton.configuration?.baseBackgroundColor = UIColor(named: "accentSunny")
    }


}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            print(city)
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
   
}

extension ViewController : WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.temperatureLabel.text = weather.temperatureString + " ºC"
            self.cityLabel.text = weather.cityName + ", " + weather.cityCountry
            
            if (weather.conditionName == "sun.max.fill" && !self.isSunny) {
                self.sunnyColor()
            } else if (self.isSunny) {
                self.cloudyColor()
            }
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

