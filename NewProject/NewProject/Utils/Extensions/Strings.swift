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
        static let title = "What the forecast?"
        static let description = "Приложение покажет погоду по вашему местоположению"
        static let firstButtonTitle = "Погода по городу"
        static let secondButonTitle = "Погода по геолокации"
    }

    enum WeatherList {
        static let veryWarm = "Жарко"
        static let warm = "Тепло"
        static let lessWarm = "Прохладно"
        static let lessCold = "Свежо"
        static let cold = "Холодно"
        static let veryCold = "Мороз"

        static let willRain = "Будут осадки"
        static let maybeRain = "Возможно будут осадки"
        static let notRain = "Не будет осадков"

        static let precititation = "Вероятность осадков"
    }

    enum GeoAccess {
        static let title = "Нет доступа"
        static let message = "Необходимо подтвердить"
        static let goToSettings = "Перейти"
        static let cancel = "Отмена"
    }
}
