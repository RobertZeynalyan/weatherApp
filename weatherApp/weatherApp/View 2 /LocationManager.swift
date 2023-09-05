//
//  LocationManager.swift
//  weatherApp
//
//  Created by Liza Zeynalyan on 05.09.2023.
//

import Foundation
import CoreLocation

class LocationManager {
    
    let locationManager = CLLocationManager()
    locationManager.delegate = self

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            // Handle location update
        }
    }
    // Request a user’s location once
    locationManager.requestLocation()
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        // Handle failure to get a user’s location
    }
    
    // Get the current location permissions
    let status = CLLocationManager.authorizationStatus()

    // Handle each case of location permissions
    switch status {
        case .authorizedAlways:
            // Handle case
        case .authorizedWhenInUse:
            // Handle case
        case .denied:
            // Handle case
        case .notDetermined:
            // Handle case
        case .restricted:
            // Handle case
    }
}
