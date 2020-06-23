//
//  WeatherListHeaderCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import SwiftDate
import UIKit

struct WeatherListHeaderCellModel: PTableViewCellModel {
    let weatherImage: UIImage
    let temperatureValueText: String
    let weatherDescriptionText: String
    let currentCityNameText: String
    let tommorowDescriptionText: String
    let tommorowTemperatureValueText: String
    let time: String
    var weatherTom: String = ""

    init(weather: Weather) {
        switch weather.weatherDescription {
        case Strings.WeatherListResponse.clear.rawValue:
            weatherImage = #imageLiteral(resourceName: "Clear w 275")
            weatherDescriptionText = Strings.WeatherListDescription.clear

        case Strings.WeatherListResponse.clouds.rawValue:
            weatherImage = #imageLiteral(resourceName: "Clouds w 275_1")
            weatherDescriptionText = Strings.WeatherListDescription.clouds

        case Strings.WeatherListResponse.rain.rawValue:
            weatherImage = #imageLiteral(resourceName: "rain")
            weatherDescriptionText = Strings.WeatherListDescription.rain

        case Strings.WeatherListResponse.drizzle.rawValue:
            weatherImage = #imageLiteral(resourceName: "drizzle")
            weatherDescriptionText = Strings.WeatherListDescription.drizzle

        case Strings.WeatherListResponse.snow.rawValue:
            weatherImage = #imageLiteral(resourceName: "snow")
            weatherDescriptionText = Strings.WeatherListDescription.snow

        case Strings.WeatherListResponse.thunderstorm.rawValue:
            weatherImage = #imageLiteral(resourceName: "rain")
            weatherDescriptionText = Strings.WeatherListDescription.thunderstorm

        case Strings.WeatherListResponse.atmosphere.rawValue:
            weatherImage = #imageLiteral(resourceName: "atmosphere")
            weatherDescriptionText = Strings.WeatherListDescription.atmosphere

        default:
            weatherImage = #imageLiteral(resourceName: "Clear w 275")
            weatherDescriptionText = Strings.WeatherListDescription.clear
        }

        if weather.temperatureToday.isLess(than: 0) {
            temperatureValueText = String(format: "%.0f\u{2103}", weather.temperatureToday)
        } else {
            temperatureValueText = String(format: "+%.0f\u{2103}", weather.temperatureToday)
        }

        if weather.temperatureTommorow.isLess(than: 0) {
            tommorowTemperatureValueText = String(format: "%.0f\u{2103}", weather.temperatureTommorow)
        } else {
            tommorowTemperatureValueText = String(format: "+%.0f\u{2103}", weather.temperatureTommorow)
        }

        currentCityNameText = weather.currentCityName
        tommorowDescriptionText = Strings.WeatherListDescription.descriptionTommorow
        time = weather.date.toDate()?.toFormat("на HH:mm, ") ?? ""

        weatherTom = testWeatherTomorrow(weather: weather.tomorrowWeatherDescription)
    }

    func configure(cell: WeatherListHeaderCell) {
        cell.currentCityName.text = currentCityNameText
        cell.iconImageView.image = weatherImage
        cell.temperatureValueLabel.text = temperatureValueText
        cell.tommorowDescriptionLabel.text = tommorowDescriptionText + " " + weatherTom.lowercased()
        cell.tommorowTemperatureValueLabel.text = tommorowTemperatureValueText
        cell.weatherDescriptionLabel.text = time + weatherDescriptionText
    }

    func testWeatherTomorrow(weather: String) -> String {
        switch weather {
        case Strings.WeatherListResponse.clear.rawValue:
            return Strings.WeatherListDescription.clear

        case Strings.WeatherListResponse.clouds.rawValue:
            return Strings.WeatherListDescription.clouds

        case Strings.WeatherListResponse.rain.rawValue:
           return  Strings.WeatherListDescription.rain

        case Strings.WeatherListResponse.drizzle.rawValue:
            return Strings.WeatherListDescription.drizzle

        case Strings.WeatherListResponse.snow.rawValue:
            return Strings.WeatherListDescription.snow

        case Strings.WeatherListResponse.thunderstorm.rawValue:
            return Strings.WeatherListDescription.thunderstorm

        case Strings.WeatherListResponse.atmosphere.rawValue:
            return Strings.WeatherListDescription.atmosphere

        default:
            return Strings.WeatherListDescription.clear
        }
    }
}
