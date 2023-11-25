//
//  LocationProvider.swift
//  weatherApp
//
//  Created by Robert on 22.11.23.
//

import CoreLocation

class LocationProvider: NSObject {
    
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    var locationUpdatedFirst: ((CLLocation) -> Void)?
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
}

extension LocationProvider: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location else { return }
        if self.location == nil {
            locationUpdatedFirst?(location)
        }
        self.location = location
    }
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
