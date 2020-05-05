//
//  WeatherListHeaderCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var dayMonthFormatter: DateFormatter = {
        let dayMonthFormatter = DateFormatter()
        dayMonthFormatter.locale = Locale(identifier: "ru_RU")
        dayMonthFormatter.dateFormat = "dd MMMM"

        return dayMonthFormatter
    }()
    static var dayMonthFormatterNext: DateFormatter = {
        let dayMonthFormatter = DateFormatter()
        dayMonthFormatter.locale = Locale(identifier: "ru_RU")
        dayMonthFormatter.dateFormat = "dd.MM"
        return dayMonthFormatter
    }()
}
