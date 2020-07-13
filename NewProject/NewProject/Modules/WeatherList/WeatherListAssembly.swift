//
//  WeatherListAssembly.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

 class WeatherListAssembly {
    let navigationController: UINavigationController
    let cityName: String?
    let coordinates: LocationCoordinate?

    init(
        navigationController: UINavigationController,
        cityName: String?,
        coordinates: LocationCoordinate?
    ) {
        self.navigationController = navigationController
        self.cityName = cityName
        self.coordinates = coordinates
    }

    func create() -> WeatherListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
            identifier: String(describing: WeatherListViewController.self)
        ) as? WeatherListViewController else {
            preconditionFailure("Cannot create WeatherListViewController")
        }

        let router = WeatherListRouter(navigationController: navigationController)
        let presenter = WeatherListPresenter(
            view: viewController,
            router: router,
            weatherAPI: WeatherAPI(network: NetworkProvider()),
            cityName: cityName,
            coordinates: coordinates
            //settingsStorage: UserDefaults.standard
        )
        viewController.presenter = presenter
        return viewController
    }
 }
