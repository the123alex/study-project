//
//  WeatherListCodeCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import SwiftDate
import UIKit

struct WeatherListCodeCellModel: PTableViewCellModel {

    var dateText: String = ""
    let temperatureValueText: String
    let weatherDescriptionText: String

    init(weather: Weather) {

        switch weather.weatherDescription {
        case Strings.WeatherListResponse.clear.rawValue:
            weatherDescriptionText = Strings.WeatherListDescription.clear

        case Strings.WeatherListResponse.clouds.rawValue:
            weatherDescriptionText = Strings.WeatherListDescription.clouds

        case Strings.WeatherListResponse.rain.rawValue:
            weatherDescriptionText = Strings.WeatherListDescription.rain

        case Strings.WeatherListResponse.drizzle.rawValue:
            weatherDescriptionText = Strings.WeatherListDescription.drizzle

        case Strings.WeatherListResponse.snow.rawValue:
            weatherDescriptionText = Strings.WeatherListDescription.snow

        case Strings.WeatherListResponse.thunderstorm.rawValue:
            weatherDescriptionText = Strings.WeatherListDescription.thunderstorm

        case Strings.WeatherListResponse.atmosphere.rawValue:
            weatherDescriptionText = Strings.WeatherListDescription.atmosphere

        default:
            weatherDescriptionText = Strings.WeatherListDescription.clear
        }

        if weather.temperatureToday <= 0 {
            temperatureValueText = String(
                format: "%.0f\u{2103}",
                weather.temperatureToday
            )
        } else {
            temperatureValueText = String(
                format: "+%.0f\u{2103}",
                weather.temperatureToday
            )
        }

        let getWeekday = weather.date.toDate()?.weekday
        let result = testWeekDay(getWeekday)
        dateText = result
    }

    func configure(cell: WeatherListCodeCell) {
        cell.dateLabel.text = dateText
        cell.temperatureValueLabel.text = temperatureValueText
        cell.weatherDescriptionLabel.text = weatherDescriptionText
    }

    func testWeekDay(_ day: Int?) -> String {
        guard let testDay = day else {
            return Strings.WeekdayByName.unknown
        }

        switch testDay {
        case Strings.WeekDaysByNumber.sunday.rawValue:
            return Strings.WeekdayByName.sunday

        case Strings.WeekDaysByNumber.monday.rawValue:
            return Strings.WeekdayByName.monday

        case Strings.WeekDaysByNumber.tuesday.rawValue:
           return Strings.WeekdayByName.tuesday

        case Strings.WeekDaysByNumber.wednesday.rawValue:
           return Strings.WeekdayByName.wednesday

        case Strings.WeekDaysByNumber.thursday.rawValue:
           return Strings.WeekdayByName.thursday

        case Strings.WeekDaysByNumber.friday.rawValue:
           return Strings.WeekdayByName.friday

        case Strings.WeekDaysByNumber.saturday.rawValue:
           return Strings.WeekdayByName.saturday

        default:
            return Strings.WeekdayByName.unknown
        }
    }
}
