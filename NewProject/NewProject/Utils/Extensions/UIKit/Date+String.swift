//
//  WeatherListHeaderCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

extension Date {
    var dayMonthString: String {
        DateFormatter.dayMonthFormatter.string(from: self)
    }
    var dayMonthStringNext: String {
        DateFormatter.dayMonthFormatterNext.string(from: self)
    }
}
