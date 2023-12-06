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
            return "sun.max.fill"
        } else if (conditionId == 200) {
            return "cloud.bolt.rain.fill"
        } else if drizzle.contains(conditionId) {
            return "cloud.drizzle.fill"
        } else if rain.contains(conditionId) {
            return "cloud.rain.fill"
        } else if snowy.contains(conditionId) {
            return "cloud.snow.fill"
        } else if foggy.contains(conditionId) {
            return "cloud.fog.fill"
        } else {
            return "smoke.fill"
        }
    }
    
}
