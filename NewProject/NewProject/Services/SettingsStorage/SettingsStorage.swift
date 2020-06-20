//
//  SettingsStorage.swift
//  NewProject
//
//  Created by Aleksey on 20.06.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

protocol SettingsStorage: AnyObject {
    var coordinates: LocationCoordinate? { get set }
}

extension UserDefaults {
    enum Keys: String {
        case latitude
        case longitude
    }
}

extension UserDefaults: SettingsStorage {
    var coordinates: LocationCoordinate? {
        get {
            guard
                let lat = value(forKey: Keys.latitude.rawValue) as? Double,
                let lon = value(forKey: Keys.longitude.rawValue) as? Double
            else {
                return nil
            }
            return LocationCoordinate(lat: lat, lon: lon)
        }
        set {
            set(newValue?.lat, forKey: Keys.latitude.rawValue)
            set(newValue?.lon, forKey: Keys.longitude.rawValue)
        }
    }
}
