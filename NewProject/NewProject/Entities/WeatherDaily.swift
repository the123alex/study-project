//
//  WeatherDaily.swift
//  NewProject
//
//  Created by Aleksey on 11.06.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

struct WeatherDaily {
    let date: Date
    let temperatureDuringDay: Double
    let weatherConditions: Set<Condition>
}

extension WeatherDaily {
    enum Condition {
        case thunderstorm
        case drizzle
        case rain
        case snow
        case atmosphere
        case clear
        case clouds
        case unknown

        var typeRange: CountableClosedRange<Int> {
        switch self {
        case .thunderstorm:
            return 200...299
        case .drizzle:
            return 300...399
        case .rain:
            return 400...499
        case .snow:
            return 500...599
        case .atmosphere:
            return 600...699
        case .clear:
            return 700...799
        case .clouds:
            return 800...899
        case .unknown:
            return 0...Int.max
        }
    }

        init(code: Int) {
        switch code {
        case Condition.thunderstorm.typeRange:
            self = .thunderstorm
        case Condition.drizzle.typeRange:
            self = .drizzle
        case Condition.rain.typeRange:
            self = .rain
        case Condition.snow.typeRange:
            self = .snow
        case Condition.atmosphere.typeRange:
            self = .atmosphere
        case Condition.clear.typeRange:
            self = .clear
        case Condition.clouds.typeRange:
            self = .clouds
        default:
            self = .unknown
            }
        }
    }
}
