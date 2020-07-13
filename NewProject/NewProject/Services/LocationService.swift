//
//  LocationService.swift
//  NewProject
//
//  Created by Aleksey on 17.06.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import CoreLocation
import Foundation

protocol LocationServiceDelegate: AnyObject {
    func didChangeAuthorizationStatus(hasAccess: Bool)
}

class LocationService: NSObject {
    private let locationManager = CLLocationManager()
    private var requestResult: ((Result<LocationCoordinate, LocationError>) -> Void)?
    weak var delegate: LocationServiceDelegate?

    var authorizationStatus: CLAuthorizationStatus {
        CLLocationManager.authorizationStatus()
    }

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestAccess() {
        locationManager.requestWhenInUseAuthorization()
    }

    func requestLocation(
        with accuracy: CLLocationAccuracy = kCLLocationAccuracyThreeKilometers,
        completion: @escaping (Result<LocationCoordinate, LocationError>) -> Void
    ) {
        switch authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            break
        case .denied, .notDetermined, .restricted:
            completion(.failure(.accessDenied))
        @unknown default:
            break
        }
        requestResult = completion
        locationManager.desiredAccuracy = accuracy
        locationManager.requestLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            requestResult?(.failure(.emptyLocation))
            return
        }
        requestResult?(.success(.init(coreLocationCoordinate: location.coordinate)))
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        requestResult?(.failure(.uknown(error)))
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            delegate?.didChangeAuthorizationStatus(hasAccess: true)
        case .denied, .notDetermined, .restricted:
            delegate?.didChangeAuthorizationStatus(hasAccess: false)
        @unknown default:
            break
        }
    }
}

extension LocationService {
    enum LocationError: Error {
        case accessDenied
        case uknown(Error)
        case emptyLocation
    }
}
