//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 15/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView = MainView()
    //var weatherManager = WeatherManager()
    
    var searchTextField: UITextField!
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField = mainView.getSearchTextField()
        //print(searchTextField.text ?? "NULL VALUE")
        searchTextField.delegate = self
        //weatherManager.delegate = self
    
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
            //weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
   
}

