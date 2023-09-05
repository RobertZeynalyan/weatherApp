//
//  ViewController.swift
//  weatherApp
//
//  Created by Liza Zeynalyan on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var weatherIcon: UIImageView!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherIcon.image = UIImage(named: "cloudy")
    }

    func getweatherData() {
       
        var searchText = (searchTextField.text ?? "").count > 0 ? searchTextField.text! : "Abovyan"
        searchText = searchText.replacingOccurrences(of: " ", with: "%20")
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?q=\(searchText)&appid=6533c74fd4ef56416b82a72fb0e52a08"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data, let weather = try? JSONDecoder().decode(WeatherData.self, from: data) {
                DispatchQueue.main.async {
                    self.countryLabel.text = weather.city.name
                    if self.weatherLabel.text != nil{
                        self.weatherLabel.text = String(Int(weather.list[0].main.temp - 273)) + " °C"
                    } else {
                        self.weatherLabel.text = "-"
                    }
                }
            }
        }
        task.resume()
    }
    
    
  //  func changeImageView(data: ) {
        
        
 //   }
    @IBAction func getWeatherButton(_ sender: UIButton!) {
        getweatherData()
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}
