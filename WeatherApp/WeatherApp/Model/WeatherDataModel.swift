//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import Foundation

class WeatherDataModel {
    var temperature = 0
    var condition = 0
    var city = ""
    var weatherIconName = ""
    
    func updateWeatherIcon(condition:Int) -> String {
        switch condition {
        case 0...232:
            return "thunderstorm"
        case 300...531:
            return "rain"
        case 600...622:
            return "snow"
        case 700...781:
            return "mist"
        case 800:
            return "sunny"
        case 801...804:
            return "clouds"
        default:
            return "No Data"
        }
    }
}
