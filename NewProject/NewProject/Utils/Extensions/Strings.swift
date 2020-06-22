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
        static let firstButtonTitle = "Погода по городу"
        static let secondButonTitle = "Погода по геолокации"
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
        static let clear = "Чистое небо"
        static let clouds = "Облака"

        static let descriptionTommorow = "Завтра"
    }
    enum GeoAccess {
        static let title = "Нет доступа"
        static let message = "Необходимо подтвердить"
        static let goToSettings = "Перейти"
        static let cancel = "Отмена"
    }

    enum CitySearchAlertText {
        static let title = "Введите название города"
        //static let message = "Необходимо подтвердить"
        static let goToForecast = "К погоде!"
        static let cancel = "Отмена"
    }
    enum CityNotFoundAlertText {
        static let title = "Город не найден"
        static let message = "Попробуйте повторно"
        static let okGo = "ОК"
    }
}
