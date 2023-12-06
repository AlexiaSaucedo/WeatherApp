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
    
    var conditionImageView: UIImageView!
    var temperatureLabel: UILabel!
    var cityLabel: UILabel!
    var searchTextField: UITextField!
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        conditionImageView = mainView.getImageView()
        temperatureLabel = mainView.getTemperatureLabel()
        cityLabel = mainView.getCityLabel()
        searchTextField = mainView.getSearchTextField()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
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
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

