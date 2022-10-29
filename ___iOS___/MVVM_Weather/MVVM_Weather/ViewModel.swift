//
//  ViewModel.swift
//  MVVM_Weather
//
//  Created by fabiocunha on 29/12/21.
//

import Foundation

// Data needed by view

class WeatherViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var descriptionText: String = "---"
    @Published var temp: String = "--"
    @Published var timezone: String = "--:--"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather(){
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,daily,minutely&lat=40.712&lon=74&unit=imperial&appid=9b155da972d575c7af1dc6adae00de77"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data, error == nil  else { return }
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temp = "\(model.current.temp)"
                    self.timezone = model.timezone
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
        
        
    }
}
