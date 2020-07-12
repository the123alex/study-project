//
//  Strings.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

enum Strings {
    enum Startup {
        static let title = "WHAT THE FORECAST?"
        static let description = "Какой прогноз?"
        static let firstButtonTitle = "ГОРОД"
        static let secondButonTitle = "ЛОКАЦИЯ"
    }
    enum WeatherListResponse: String {
        case thunderstorm = "Thunderstorm"
        case drizzle = "Drizzle"
        case rain = "Rain"
        case snow = "Snow"
        case atmosphere = "Atmosphere"
        case clear = "Clear"
        case clouds = "Clouds"
    }

    enum WeatherListDescription {
        static let thunderstorm = "Гроза"
        static let drizzle = "Мелкий дождь"
        static let rain = "Дождь"
        static let snow = "Снег"
        static let atmosphere = "Туман"
        static let clear = "Ясно"
        static let clouds = "Облачно"

        static let tomorrowWord = "Завтра"
    }
    enum GeoAccess {
        static let title = "Нет доступа"
        static let message = "Необходимо предоставить доступ к локации."
        static let goToSettings = "Перейти"
        static let cancel = "Отмена"
    }

    enum CitySearchAlertText {
        static let textFieldPlaceholder = "Например: Москва"
        static let title = "Введите название города"
        static let goToForecast = "К погоде!"
        static let cancel = "Отмена"
        static let toMainScreen = "Главный экран"
    }
    enum CityNotFoundAlertText {
        static let title = "Город не найден"
        static let message = "Попробуйте повторно"
        static let okGo = "ОК"
    }

    enum SystemIconName {
        static let lineHorizontalThree = "line.horizontal.3"
        static let escape = "escape"
        static let info = "info"
        static let infoCircle = "info.circle"
        static let arrowCirclePath = "arrow.2.circlepath"
        static let arrowDown = "arrow.down"
        static let arrowTriangle = "arrowtriangle.down"
    }

   enum WeekDaysByNumber: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7

    case unknown = 0

    var name: String {
        switch self {
        case .monday:
            return "Понедельник"
        case .tuesday:
            return "Вторник"
        case .wednesday:
            return "Среда"
        case .thursday:
            return "Четверг"
        case .friday:
            return "Пятница"
        case .saturday:
            return "Суббота"
        case .sunday:
            return "Воскресенье"

        default:
            return ""
        }
    }
    }
}
