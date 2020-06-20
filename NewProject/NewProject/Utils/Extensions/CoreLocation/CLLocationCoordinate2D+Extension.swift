//
//  CLLocationCoordinate2D+Extension.swift
//  NewProject
//
//  Created by Aleksey on 11.06.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D {
    var locationCoordinate: LocationCoordinate {
        LocationCoordinate(coreLocationCoordinate: self)
    }
}
