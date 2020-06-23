//
//  StartupPresenter.swift
//  NewProject
//
//  Created by Aleksey on 28.03.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

 class StartupPresenter {

    private weak var view: StartupViewController?
    private let router: StartupRouter
    private let weatherAPI: WeatherAPIProtocol
    private let locationService: LocationService
    private var isRequestLocationNeeded: Bool = false

    init(
        view: StartupViewController,
        router: StartupRouter,
        weatherAPI: WeatherAPIProtocol,
        locationService: LocationService
    ) {
        self.view = view
        self.router = router
        self.weatherAPI = weatherAPI
        self.locationService = locationService
    }

    func viewDidLoad() {
        let startupViewModel = StartupViewModel(
            title: Strings.Startup.title,
            description: Strings.Startup.description,
            firstButtonTitle: Strings.Startup.firstButtonTitle,
            secondButtonTitle: Strings.Startup.secondButonTitle)

        view?.bindData(with: startupViewModel
        )

        locationService.delegate = self
    }

    func didTapWeatherListButton() {
        router.showCitySelect()
    }

    func didTapLocationButton() {
        switch locationService.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            requestLocation()
        case .notDetermined:
            locationService.requestAccess()
            isRequestLocationNeeded = true
        case .denied, .restricted:
            router.showLocationDisabledAlert()
            isRequestLocationNeeded = true
        @unknown default:
            break
        }
    }
 }

extension StartupPresenter: LocationServiceDelegate {
    func didChangeAuthorizationStatus(hasAccess: Bool) {
        guard isRequestLocationNeeded, hasAccess else {
            return
        }
        isRequestLocationNeeded = false
        requestLocation()
    }
}

private extension StartupPresenter {
    func requestLocation() {
        locationService.requestLocation { [router] result in
            switch result {
            case .success(let coordinates):
                router.showWeatherList(cityName: nil, coordinates: coordinates)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
