//
//  LocationCoordinate.swift
//  NewProject
//
//  Created by Aleksey on 11.06.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import CoreLocation
import Foundation

struct LocationCoordinate {
    let lat: Double
    let lon: Double

    init(coreLocationCoordinate: CLLocationCoordinate2D) {
        self.lat = coreLocationCoordinate.latitude
        self.lon = coreLocationCoordinate.longitude
    }

    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }

    var coreLocationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
