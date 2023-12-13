//
//  ViewController.swift
//  weatherApp
//
//  Created by Liza Zeynalyan on 31.08.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    var temp: String = ""
    var weatherFromHours: [Double] = []
    private var locationProvider = LocationProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addTapGesture()
        configTableView()
        setBackgroundByTimezone(seconds: TimeZone.current.secondsFromGMT())
        setupStyles()
        locationProvider.locationUpdatedFirst = { [weak self] location in
            self?.fetchCurrentCityData(location: location)
        }
    }
    
    func fetchCurrentCityData(location: CLLocation) {
        location.fetchCityAndCountry { [weak self] city, country, error in
            if let city = city {
                self?.getweatherData(searchText: city)
            }
        }
    }

    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gestureAction))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func gestureAction() {
        searchBar.resignFirstResponder()
        print(weatherFromHours)
    }
    
    func setupStyles() {
        countryLabel.textDropShadow()
        weatherLabel.textDropShadow()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func configTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: .none), forCellReuseIdentifier: "TableViewCell")
        tableView.register(UINib(nibName: "SecondTableViewCell", bundle: .none), forCellReuseIdentifier: "SecondTableViewCell")
        tableView.backgroundColor = nil
    }
    
    func getweatherData(searchText: String) {
        var searchText = searchText.isEmpty ? "San Francisco" : searchText
        searchText = searchText.replacingOccurrences(of: " ", with: "%20")
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?q=\(searchText)&appid=6533c74fd4ef56416b82a72fb0e52a08"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data, let weather = try? JSONDecoder().decode(WeatherData.self, from: data) {
                DispatchQueue.main.async {
                    self.countryLabel.text = weather.city.name
                    if self.weatherLabel.text != nil{
                        self.weatherLabel.text = String(Int(weather.list[0].main.temp - 273)) + "°C"
                    } else {
                        self.weatherLabel.text = "-"
                    }
                    self.setBackgroundByTimezone(seconds: weather.city.timezone)
                    for item in weather.list [0...4] {
                        self.weatherFromHours.append(item.main.temp)
                    }
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
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            return cell
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty != nil {
            temp = searchBar.text!
        }
        getweatherData(searchText: temp)
        searchBar.resignFirstResponder()
    }
}

extension UILabel {
    
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
}
