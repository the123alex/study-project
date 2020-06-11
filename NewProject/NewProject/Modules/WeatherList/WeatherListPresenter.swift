//
//  WeatherListPresenter.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable force_unwrapping

import Foundation

class WeatherListPresenter {

    private weak var view: WeatherListViewController?
    private let router: WeatherListRouter
    private let weatherAPI: WeatherAPI

    init(
        view: WeatherListViewController,
        router: WeatherListRouter,
        weatherAPI: WeatherAPI
    ) {
        self.view = view
        self.router = router
        self.weatherAPI = weatherAPI
    }

    func viewDidLoad() {
        //var weatherToday: Weather
        var weatherArray: [Weather] = []

        weatherAPI.loadWeather(by: "Moscow") { [weak self] result in
            switch result {
            case .success(let responseDTO):
                for element in responseDTO.list {
                    weatherArray.append(Weather(
                        temperature: element.main.temp,
                        date: Date(),
                        precipitationChance: Double(element.main.humidity)
                    ))
                }
//                let currentDay = Date()
//                                var nextDay = DateComponents()
//                                nextDay.day = 1
//                            //    let weatherToday = Weather(
//                            //        temperature: Double.random(in: -30 ... 40).rounded(),
//                            //        date: Date(),
//                            //        precipitationChance: Double.random(in: 0...100).rounded()
//                            //    )
//
//                                let weatherFirst = Weather(
//                                    temperature: Double.random(in: -30 ... 40).rounded(),
//                                    date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
//                                    precipitationChance: Double.random(in: 0...100).rounded()
//                                )
//                                nextDay.day? += 1
//
//                                let weatherSecond = Weather(
//                                    temperature: Double.random(in: -30 ... 40).rounded(),
//                                    date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
//                                    precipitationChance: Double.random(in: 0...100).rounded()
//                                )
//                                nextDay.day? += 1
//
//                                let weatherThird = Weather(
//                                    temperature: Double.random(in: -30 ... 40).rounded(),
//                                    date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
//                                    precipitationChance: Double.random(in: 0...100).rounded()
//                                )
//                                nextDay.day? += 1
//
//                                let weatherFourth = Weather(
//                                    temperature: Double.random(in: -30 ... 40).rounded(),
//                                    date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
//                                    precipitationChance: Double.random(in: 0...100).rounded()
//                                )
//                                nextDay.day? += 1
//
//                                let weatherFifth = Weather(
//                                    temperature: Double.random(in: -30 ... 40).rounded(),
//                                    date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
//                                    precipitationChance: Double.random(in: 0...100).rounded()
//                                )
//                                nextDay.day? += 1
//
//                                let weatherSixth = Weather(
//                                    temperature: Double.random(in: -30 ... 40).rounded(),
//                                    date: Calendar.current.date(byAdding: nextDay, to: currentDay) ?? Date(),
//                                    precipitationChance: Double.random(in: 0...100).rounded()
//                                )
//
//                                let cellModels: [PTableViewCellAnyModel] = [
//                                    WeatherListHeaderCellModel(weather: weatherToday),
//                                    WeatherListCodeCellModel(weather: weatherFirst),
//                                    WeatherListCodeCellModel(weather: weatherSecond),
//                                    WeatherListCodeCellModel(weather: weatherThird),
//                                    WeatherListCodeCellModel(weather: weatherFourth),
//                                    WeatherListCodeCellModel(weather: weatherFifth),
//                                    WeatherListCodeCellModel(weather: weatherSixth)
//                                ]
                var cellModels: [PTableViewCellAnyModel] = []

                for element in weatherArray {
                    cellModels.append(WeatherListCodeCellModel(weather: element))
                }
                            self!.view?.showData(with: cellModels)
            case .failure(let error):
                           print(result)

                           print(error.localizedDescription)
                          }
        }
    }
}
