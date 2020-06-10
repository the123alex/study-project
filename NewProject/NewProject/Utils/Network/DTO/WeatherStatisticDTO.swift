//
//  WeatherStatisticDTO.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable nesting
import Foundation

struct WeatherStatisticDTO: Decodable {

    struct List: Decodable {
        let dateNumber: Int
        let main: MainInformation
        let weather: [WeatherInformation]
        let clouds: Clouds
        let wind: Wind
        let sys: Sys
        let dateText: String

        enum CodingKeys: String, CodingKey {
            case dateNumber = "dt"
            case main
            case weather
            case clouds
            case wind
            case sys
            case dateText = "dt_txt"
        }
    }
}

struct MainInformation: Decodable {
    let temp: Double
    }

struct WeatherInformation: Decodable {
    let main: String
    let description: String
}

struct Clouds: Decodable {
    let all: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct Sys: Decodable {
    let pod: String
}
