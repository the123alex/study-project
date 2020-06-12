//
//  WeatherListHeaderCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

struct WeatherListHeaderCellModel: PTableViewCellModel {
    let weatherImage: UIImage
    let dateText: String
    let temperatureValueText: String
    let weatherDescriptionText: String
    let precipitationText: String

    init(weather: Weather) {
        switch weather.temperature {
        case -30 ... -20:
            weatherImage = #imageLiteral(resourceName: "veryCold")
            weatherDescriptionText = Strings.WeatherList.veryCold
            precipitationText = Strings.WeatherList.notRain
        case -19 ... -10:
            weatherImage = #imageLiteral(resourceName: "cold")
            weatherDescriptionText = Strings.WeatherList.cold
            precipitationText = Strings.WeatherList.maybeRain
        case -9 ... 0:
            weatherImage = #imageLiteral(resourceName: "lessCold")
            weatherDescriptionText = Strings.WeatherList.lessCold
            precipitationText = Strings.WeatherList.willRain
        case 1 ... 15:
            weatherImage = #imageLiteral(resourceName: "lessWarm")
            weatherDescriptionText = Strings.WeatherList.lessWarm
            precipitationText = Strings.WeatherList.notRain
        case 16 ... 25:
            weatherImage = #imageLiteral(resourceName: "warm")
            weatherDescriptionText = Strings.WeatherList.warm
            precipitationText = Strings.WeatherList.willRain
        case 26 ... 40:
            weatherImage = #imageLiteral(resourceName: "veryWarm")
            weatherDescriptionText = Strings.WeatherList.veryWarm
            precipitationText = Strings.WeatherList.maybeRain
        default:
            weatherImage = #imageLiteral(resourceName: "default")
            weatherDescriptionText = Strings.WeatherList.warm
            precipitationText = Strings.WeatherList.willRain
        }
        if weather.temperature.isLess(than: 0) {
            temperatureValueText = String(format: "%.0f\u{2103}", weather.temperature)
        } else {
            temperatureValueText = String(format: "+%.0f\u{2103}", weather.temperature)
        }
        //dateText = weather.date.dayMonthString
        dateText = weather.date.toString(.custom("dd.MM"))
    }

    func configure(cell: WeatherListHeaderCell) {
        cell.dateLabel.text = dateText
        cell.iconImageView.image = weatherImage
        cell.precipitationLabel.text = precipitationText
        cell.temperatureValueLabel.text = temperatureValueText
        cell.weatherLabel.text = weatherDescriptionText
    }
}
