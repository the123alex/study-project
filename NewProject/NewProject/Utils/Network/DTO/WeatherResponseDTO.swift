//
//  WeatherStatisticDTO.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable nesting
import Foundation

struct WeatherResponseDTO: Decodable {
    let cod: String
    let message: Double
    let list: [List]
    let city: City

    struct List: Decodable {
        let dateNumber: Int
        let main: MainInformation
        let weather: [WeatherInformation]
        let clouds: Clouds
        let wind: Wind
        let dateText: String

        enum CodingKeys: String, CodingKey {
            case dateNumber = "dt"
            case main
            case weather
            case clouds
            case wind
            case dateText = "dt_txt"
        }
    }

    struct MainInformation: Decodable {
        let temp: Double
        let humidity: Int
        }

    struct WeatherInformation: Decodable {
        let id: Int
        let main: String
        let description: String
    }

    struct Clouds: Decodable {
        let all: Int
    }

    struct Wind: Decodable {
        let speed: Double
    }

    struct City: Decodable {
        let name: String
        let sunrise: Int
        let sunset: Int
    }
}
