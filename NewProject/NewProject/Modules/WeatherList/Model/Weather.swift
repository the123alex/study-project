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
    let temperature: Double
    let date: DateInRegion
    let precipitationChance: Double
    let currentCity: String
}
