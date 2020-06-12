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
        var weatherArray: [Weather] = []

        weatherAPI.loadWeather(by: "Курганинск") { [weak self] result in
            switch result {
            case .success(let responseDTO):
                for element in responseDTO.list {
                    weatherArray.append(Weather(
                        temperature: element.main.temp,
                        date: Date(),
                        precipitationChance: Double(element.main.humidity)
                    ))
                }
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
