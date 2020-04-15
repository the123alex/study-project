//
//  WeatherListCodeCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

struct WeatherListCodeCellModel: PTableViewCellModel {

    let weatherImage: UIImage
    let dateText: String
    let temperatureValueText: String
    let precipitationChanceDescriptionText: String
    let precipitationChanceValueText: String

    init(weather: Weather) {
        switch weather.temperature {
        case -30 ... -20:
            weatherImage = #imageLiteral(resourceName: "veryCold")
        case -19 ... -10:
            weatherImage = #imageLiteral(resourceName: "cold")
        case -9 ... 0:
            weatherImage = #imageLiteral(resourceName: "lessCold")
        case 1 ... 15:
            weatherImage = #imageLiteral(resourceName: "lessWarm")
        case 16 ... 25:
            weatherImage = #imageLiteral(resourceName: "warm")
        case 26 ... 40:
            weatherImage = #imageLiteral(resourceName: "veryWarm")
        default:
            weatherImage = #imageLiteral(resourceName: "default")
        }

        if weather.temperature.isLess(than: 0) {
            temperatureValueText = String(
                format: "%.0f\u{2103}",
                weather.temperature
            )
        } else {
            temperatureValueText = String(
                format: "%.0f\u{2103}",
                weather.temperature
            )
        }
        dateText = weather.date.dayMonthStringNext
        precipitationChanceDescriptionText = Strings.WeatherList.precititation

        precipitationChanceValueText = String(
            format: "%.0f",
            weather.precipitationChance
        ) + "\u{0025}"
    }

    func configure(cell: WeatherListCodeCell) {
        cell.dateLabel.text = dateText
        cell.iconImageView.image = weatherImage
        cell.temperatureValueLabel.text = temperatureValueText
        cell.precipitationDescriptionLabel.text = precipitationChanceDescriptionText
        cell.precipitationValueLabel.text = precipitationChanceValueText
    }
}
