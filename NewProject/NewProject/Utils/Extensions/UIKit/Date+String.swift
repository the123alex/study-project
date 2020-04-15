//
//  DateFormatter+String.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 09.04.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

extension Date {
    var dayMonthString: String {
        DateFormatter.dayMonthFormatter.string(from: self)
    }
}
