//
//  WeatherListCodeCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable explicit_init

import SwiftDate
import UIKit

struct WeatherListCodeCellModel: PTableViewCellModel {

    var dateText: String = ""
    let temperatureValueText: String
    let weatherDescriptionText: String

    init(weather: Weather) {
        weatherDescriptionText = weather.weatherDescriptionText

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
        guard
            let testDay = day,
            let testDayTest = Strings.WeekDaysByNumber.init(rawValue: testDay)
        else {
            return ""
        }

        return testDayTest.name
    }
}
