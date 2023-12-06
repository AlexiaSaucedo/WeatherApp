//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 02/12/23.
//

import Foundation

struct WeatherData: Codable {
    let location: Location
    let current: Current
}

struct Current : Codable {
    let temperature: Int
    let weather_code: Int
}

struct Location: Codable {
    let name: String
    let country: String
}
