//
//  WeatherListPresenter.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable force_unwrapping
//swiftlint:disable closure_end_indentation

import Foundation
import SwiftDate

class WeatherListPresenter {

    private weak var view: WeatherListViewController?
    private let router: WeatherListRouter
    private let weatherAPI: WeatherAPI
    let cityName: String?
    let coordinates: LocationCoordinate?
    //private let settingsStorage: SettingsStorage
    var weatherArray: [Weather] = []

    init(
        view: WeatherListViewController,
        router: WeatherListRouter,
        weatherAPI: WeatherAPI,
        cityName: String?,
        coordinates: LocationCoordinate?
        //settingsStorage: SettingsStorage
    ) {
        self.view = view
        self.router = router
        self.weatherAPI = weatherAPI
        self.cityName = cityName
        self.coordinates = coordinates
        //self.settingsStorage = settingsStorage
    }

    func viewDidLoad() {

        //settingsStorage.coordinates = LocationCoordinate(lat: <#T##Double#>, lon: <#T##Double#>)
        if let coordinates = self.coordinates {
            loadWeather(city: nil, coord: coordinates)
        } else if let cityName = self.cityName {
            loadWeather(city: cityName, coord: nil)
        } else {
            assertionFailure("Coordinations or city name must be not nil")
        }
    }
}

extension WeatherListPresenter {

    func loadWeather(city: String?, coord: LocationCoordinate?) {
        weatherAPI.loadWeather(
        byCityName: city,
        byCoordination: coord
        ) { [weak self] result in

            switch result {
            case .success(let responseDTO):
                for element in responseDTO.list {
                    let testDate = element.dateText.toDate()
                    //let helpDate = DateInRegion().dateAt(.endOfDay)
                    //if testDate?.isToday ?? true {
                    self!.weatherArray.append(Weather(
                        temperatureToday: element.main.temp,
                        temperatureTommorow: element.main.temp,
                        weatherDescription: element.weather[0].main,
                        currentCityName: responseDTO.city.name
                    ))
                    //}
                }
                var cellModels: [PTableViewCellAnyModel] = []
                cellModels.append(WeatherListHeaderCellModel(weather: self!.weatherArray[0]))
        //                for index in 1 ..< weatherArray.count {
        //                    cellModels.append(WeatherListCodeCellModel(weather: weatherArray[index]))
        //                }
                self!.view?.showData(with: cellModels)
            case .failure(let error):
                switch error {
                case .httpFailure(404):
                    self!.notFindCity()
                default:
                    return
                }
                print(result)
                print(error.localizedDescription)
            }
        }
    }
}

extension WeatherListPresenter {

    func notFindCity() {
         let alert = UIAlertController(
            title: Strings.CityNotFoundAlertText.title,
            message: Strings.CityNotFoundAlertText.message,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(
            title: Strings.CityNotFoundAlertText.okGo,
            style: .default,
            handler: { _ in
                self.showCitySelect()
        }
            ))
        self.view?.present(alert, animated: true)
    }

    func showCitySelect() {
        let alert = UIAlertController(
            title: Strings.CitySearchAlertText.title,
            message: nil,
            preferredStyle: .alert
        )
        alert.addTextField { textField in
            textField.placeholder = Strings.CitySearchAlertText.textFieldPlaceholder
        }

        alert.addAction(UIAlertAction(
            title: Strings.CitySearchAlertText.goToForecast,
            style: .default,
            handler: { _ in
                guard let textField = alert.textFields?.first?.text else {
                    self.showCitySelect()
                    return
                }
                if textField.isEmpty {
                    self.showCitySelect()
                }
                self.loadWeather(city: textField, coord: nil)
        }
        ))

        alert.addAction(UIAlertAction(
            title: Strings.CitySearchAlertText.toMainScreen,
            style: .default,
            handler: { _ in
                self.router.backToMainScreen()
        }
        ))
        self.view?.present(alert, animated: true)
    }
}
