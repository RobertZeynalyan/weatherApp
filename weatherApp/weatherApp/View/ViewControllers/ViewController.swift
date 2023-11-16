//
//  ViewController.swift
//  weatherApp
//
//  Created by Liza Zeynalyan on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherIcon.image = UIImage(named: "cloudy")
        setBackgroundByTimezone(seconds: TimeZone.current.secondsFromGMT())
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gestureAction))
        self.view.addGestureRecognizer(tapGesture)
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
                        self.weatherLabel.text = String(Int(weather.list[1].main.temp - 273)) + " °C"
                    } else {
                        self.weatherLabel.text = "-"
                    }
                    self.setBackgroundByTimezone(seconds: weather.city.timezone)
                }
            }
        }
        task.resume()
    }
    
    
    func setBackgroundByTimezone(seconds: Int) {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: seconds)
        formatter.dateFormat = "HH"
        let dateString = formatter.string(from: Date())
        if let hours = Int(dateString) {
            if hours >= 6 && hours <= 18 {
                backgroundImageView.image = UIImage(named: "day")
            } else {
                backgroundImageView.image = UIImage(named: "night")
            }
        }
    }
    
    @objc func gestureAction() {
        searchTextField.resignFirstResponder()
    }
    
    @IBAction func getWeatherButton(_ sender: UIButton!) {
        getweatherData()
    }
}
