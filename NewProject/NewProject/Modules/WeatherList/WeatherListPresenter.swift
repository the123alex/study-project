//
//  WeatherListPresenter.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

class WeatherListPresenter {

   private weak var view: WeatherListViewController?
   private let router: WeatherListRouter

   init(
       view: WeatherListViewController,
       router: WeatherListRouter
   ) {
       self.view = view
       self.router = router
   }

   func viewDidLoad() {
    let currentDay = Date()
    var nextDay = DateComponents()
    nextDay.day = 1
    let weatherHead = Weather(
        temperature: Float.random(in: -30 ... 40).rounded(),
        date: Date(),
        precipitationChance: Float.random(in: 0...100).rounded()
    )

    let weatherFirst = Weather(
        temperature: Float.random(in: -30 ... 40).rounded(),
        date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
        precipitationChance: Float.random(in: 0...100).rounded()
    )
    nextDay.day? += 1

    let weatherSecond = Weather(
        temperature: Float.random(in: -30 ... 40).rounded(),
        date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
        precipitationChance: Float.random(in: 0...100).rounded()
    )
    nextDay.day? += 1

    let weatherThird = Weather(
        temperature: Float.random(in: -30 ... 40).rounded(),
        date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
        precipitationChance: Float.random(in: 0...100).rounded()
    )
    nextDay.day? += 1

    let weatherFourth = Weather(
        temperature: Float.random(in: -30 ... 40).rounded(),
        date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
        precipitationChance: Float.random(in: 0...100).rounded()
    )
    nextDay.day? += 1

    let weatherFifth = Weather(
        temperature: Float.random(in: -30 ... 40).rounded(),
        date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
        precipitationChance: Float.random(in: 0...100).rounded()
    )
    nextDay.day? += 1

    let weatherSixth = Weather(
        temperature: Float.random(in: -30 ... 40).rounded(),
        date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
        precipitationChance: Float.random(in: 0...100).rounded()
    )

    let cellModels: [PTableViewCellAnyModel] = [
        WeatherListHeaderCellModel(weather: weatherHead),
        WeatherListCodeCellModel(weather: weatherFirst),
        WeatherListCodeCellModel(weather: weatherSecond),
        WeatherListCodeCellModel(weather: weatherThird),
        WeatherListCodeCellModel(weather: weatherFourth),
        WeatherListCodeCellModel(weather: weatherFifth),
        WeatherListCodeCellModel(weather: weatherSixth)
    ]
    view?.showData(with: cellModels)
   }
}
