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
    let lan: Double
    let lon: Double

    var coreLocationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lan, longitude: lon)
    }
}
