//
//  WeatherManager.swift
//  Clima
//
//  Created by Vardan on 1/6/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//  

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=6971ba35d7581501cb601b5260fed763"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchURl(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString)
    }
    
    
    
    func performRequest(_ urlString: String){
        //1. Crate a URL
        if let url = URL(string: urlString){
            
            //2. Crate URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the sesson a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WheaterData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            
            let weather = WeatherModel(condithionID: id, cityName: cityName, temp: temp)
            
            return weather
        } catch{
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
    
    
}


