//
//  WeatherListPresenter.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable force_unwrapping

import Foundation
import SwiftDate

class WeatherListPresenter {

    private weak var view: WeatherListViewController?
    private let router: WeatherListRouter
    private let weatherAPI: WeatherAPI
    let cityName: String?
    let coordinates: LocationCoordinate?
    private let settingsStorage: SettingsStorage

    init(
        view: WeatherListViewController,
        router: WeatherListRouter,
        weatherAPI: WeatherAPI,
        cityName: String?,
        coordinates: LocationCoordinate?,
        settingsStorage: SettingsStorage
    ) {
        self.view = view
        self.router = router
        self.weatherAPI = weatherAPI
        self.cityName = cityName
        self.coordinates = coordinates
        self.settingsStorage = settingsStorage
    }

    func viewDidLoad() {
        var weatherArray: [Weather] = []
        //settingsStorage.coordinates = LocationCoordinate(lat: <#T##Double#>, lon: <#T##Double#>)
        if let coordinates = self.coordinates {
        } else if let cityName = self.cityName {
        } else {
            assertionFailure("Coordinations or city name must be not nil")
        }

        weatherAPI.loadWeather(by: "Москва") { [weak self] result in
            switch result {
            case .success(let responseDTO):
                for element in responseDTO.list {
                    let testDate = element.dateText.toDate()
                    let helpDate = DateInRegion().dateAt(.endOfDay)
                    weatherArray.append(Weather(
                        temperature: element.main.temp,
                        date: testDate ?? helpDate,
                        precipitationChance: Double(element.main.humidity),
                        currentCity: responseDTO.city.name
                    ))
                }
                var cellModels: [PTableViewCellAnyModel] = []
                cellModels.append(WeatherListHeaderCellModel(weather: weatherArray[0]))

                for index in 1 ..< weatherArray.count {
                    cellModels.append(WeatherListCodeCellModel(weather: weatherArray[index]))
                }
                self!.view?.showData(with: cellModels)
            case .failure(let error):
                print(result)
                print(error.localizedDescription)
            }
        }
    }
}
