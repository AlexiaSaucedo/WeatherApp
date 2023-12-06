//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 02/12/23.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let cityCountry: String
    let temperature: Int
    
    var temperatureString: String {
        return String(temperature)
    }
    
    var conditionName: String {
        let drizzle = Set([263, 266, 281, 284])
        let rain = Set([176, 293, 296, 299, 302, 305, 308, 311])
        let snowy = Set([179,182,185,227,230])
        let foggy = Set([248,260])
        
        if(conditionId == 113){
            return "sun.max"
        } else if (conditionId == 200) {
            return "cloud.bolt"
        } else if drizzle.contains(conditionId) {
            return "cloud.drizzle"
        } else if rain.contains(conditionId) {
            return "cloud.rain"
        } else if snowy.contains(conditionId) {
            return "cloud.snow"
        } else if foggy.contains(conditionId) {
            return "cloud.fog"
        } else {
            return "cloud"
        }
    }
    
}
