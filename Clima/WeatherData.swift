//
//  WeatherData.swift
//  Clima
//
//  Created by Vardan on 1/6/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WheaterData: Codable {
    let name : String
    let main : Main
    let weather: [Weather]
    
}

struct Main: Codable {
    let temp: Float
}

struct Weather: Codable {
    let id: Int
}
