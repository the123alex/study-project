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
    var weekArray: [Weather] = []
    var finalTodayWeather: Weather?

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
                self!.decodeWeekDays(responseForDecode: responseDTO)

                var cellModels: [PTableViewCellAnyModel] = []
                cellModels.append(WeatherListHeaderCellModel(weather: self!.finalTodayWeather!))

                self?.weekArray.forEach({ element in
                    cellModels.append(WeatherListCodeCellModel(weather: element))
                })
                self!.view?.showData(with: cellModels)
            case .failure(let error):
                switch error {
                case .httpFailure(404):
                    self!.notFindCity()
                default:
                    return
                }
            }
        }
    }
}
extension WeatherListPresenter {
    func decodeWeekDays(responseForDecode: WeatherResponseDTO) {
        var tomorrowTempDay: Double = 0.0
        var tomorrowWeatherDescription: String = ""
        var tomorrowDateText: String = ""
        var tomorrowTempMidnight: Double = 0.0
        self.weekArray.removeAll()
        self.weatherArray.removeAll()

        for element in responseForDecode.list {
            guard let testDate = element.dateText.toDate()?.convertTo() else {
                continue
            }
            let date = Date().in(region: .current)
            if testDate.day == date.day {
                self.weatherArray.append(Weather(
                    temperatureToday: element.main.temp,
                    temperatureTommorow: element.main.temp,
                    weatherDescriptionMain: element.weather[0].main,
                    weatherDescriptionText: element.weather[0].description,
                    tomorrowWeatherDescription: "",
                    date: element.dateText,
                    currentCityName: responseForDecode.city.name
                ))
            } else if testDate.isInFuture && testDate.day != date.day + 1 && testDate.hour == 15 {
                self.weekArray.append(Weather(
                    temperatureToday: element.main.temp,
                    temperatureTommorow: element.main.temp,
                    weatherDescriptionMain: element.weather[0].main,
                    weatherDescriptionText: element.weather[0].description,
                    tomorrowWeatherDescription: "",
                    date: element.dateText,
                    currentCityName: responseForDecode.city.name
                ))
            } else if testDate.day == date.day + 1 && testDate.hour == 15 {
                tomorrowWeatherDescription = element.weather[0].description
                tomorrowTempDay = element.main.temp
            } else if testDate.day == date.day + 1 && testDate.hour == 0 {
                tomorrowTempMidnight = element.main.temp
                tomorrowDateText = element.dateText
            }
        }
        if self.weatherArray.count == 1 {
            self.finalTodayWeather = weatherArray[0]
            self.finalTodayWeather?.temperatureTommorow = tomorrowTempDay
            self.finalTodayWeather?.temperatureToday = tomorrowTempMidnight
            self.finalTodayWeather?.date = tomorrowDateText
            self.finalTodayWeather?.tomorrowWeatherDescription = tomorrowWeatherDescription
        } else {
            self.finalTodayWeather = weatherArray[1]
            self.finalTodayWeather?.tomorrowWeatherDescription = tomorrowWeatherDescription
            self.finalTodayWeather?.temperatureTommorow = tomorrowTempDay
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
                self.showCitySelect(weatherList: false)
        }
            ))
        self.view?.present(alert, animated: true)
    }

    func showCitySelect(weatherList: Bool) {
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
                    self.showCitySelect(weatherList: true)
                    return
                }
                if textField.isEmpty {
                    weatherList ? self.showCitySelect(weatherList: true) : self.showCitySelect(weatherList: false)
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
        if weatherList {
            alert.addAction(UIAlertAction(
                title: Strings.CitySearchAlertText.cancel,
                style: .default,
                handler: nil
            ))
        }
        self.view?.present(alert, animated: true)
    }
}
