//
//  Weather.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation
import SwiftDate

struct Weather {
    var temperatureToday: Double
    var temperatureTommorow: Double
    let weatherDescriptionMain: String
    var weatherDescriptionText: String
    var tomorrowWeatherDescription: String
    var date: String
    let currentCityName: String
}
