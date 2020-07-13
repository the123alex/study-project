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
    let tommorowWordText: String
    let tommorowTemperatureValueText: String
    let time: String
    var weatherTom: String = ""

    init(weather: Weather) {
        switch weather.weatherDescriptionMain {
        case Strings.WeatherListResponse.clear.rawValue:
            weatherImage = #imageLiteral(resourceName: "Clear w 275")

        case Strings.WeatherListResponse.clouds.rawValue:
            weatherImage = #imageLiteral(resourceName: "Clouds w 275_1")

        case Strings.WeatherListResponse.rain.rawValue:
            weatherImage = #imageLiteral(resourceName: "rain")

        case Strings.WeatherListResponse.drizzle.rawValue:
            weatherImage = #imageLiteral(resourceName: "drizzle")

        case Strings.WeatherListResponse.snow.rawValue:
            weatherImage = #imageLiteral(resourceName: "snow")

        case Strings.WeatherListResponse.thunderstorm.rawValue:
            weatherImage = #imageLiteral(resourceName: "thunderstorm")

        case Strings.WeatherListResponse.atmosphere.rawValue:
            weatherImage = #imageLiteral(resourceName: "atmosphere")

        default:
            weatherImage = #imageLiteral(resourceName: "Clear w 275")
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
        tommorowWordText = Strings.WeatherListDescription.tomorrowWord
        time = weather.date.toDate()?.toFormat("на HH:mm ") ?? ""

        weatherTom = weather.tomorrowWeatherDescription.lowercased()
        weatherDescriptionText = weather.weatherDescriptionText.lowercased()
    }

    func configure(cell: WeatherListHeaderCell) {
        cell.currentCityName.text = currentCityNameText
        cell.iconImageView.image = weatherImage
        cell.temperatureValueLabel.text = temperatureValueText
        cell.tommorowDescriptionLabel.text = tommorowWordText + " " + weatherTom.lowercased()
        cell.tommorowTemperatureValueLabel.text = tommorowTemperatureValueText
        cell.weatherDescriptionLabel.text = time + weatherDescriptionText
    }
}
