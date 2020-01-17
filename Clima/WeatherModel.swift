//
//  WeatherModel.swift
//  Clima
//
//  Created by Vardan on 1/8/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let condithionID: Int
    let cityName: String
    var temp: Float

    
    var tempString: String {
        return String(format: "%.0f", roundedTemp)
    }
    
    var condithinName: String   {
         switch condithionID {
         case 200...232:
             return "cloud.bolt"
         case 300...321:
             return "cloud.drizzle"
         case 511, 600...622:
             return "snow"
         case 500...531:
             return "cloud.rain"
         case 800:
             return "sun.max"
         case 801:
             return "cloud.sun"
         case 802:
             return "cloud"
         case 803, 804:
             return "smoke"
         default:
             return "fog"
         }
    }
    
}
