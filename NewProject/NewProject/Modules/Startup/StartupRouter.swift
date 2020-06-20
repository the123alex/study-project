//
//  StartupRouter.swift
//  NewProject
//
//  Created by Aleksey on 28.03.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

 class StartupRouter {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showLocationDisabledAlert() {
        let alert = UIAlertController(
            title: Strings.GeoAccess.title,
            message: Strings.GeoAccess.message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: Strings.GeoAccess.goToSettings,
            style: .default,
            handler: { _ in
                self.showAppPreferences()
            }
        ))

        alert.addAction(UIAlertAction(
            title: Strings.GeoAccess.cancel,
            style: .cancel,
            handler: nil
        ))
        navigationController.present(alert, animated: true)
    }

    func showWeatherList(cityName: String?, coordinates: LocationCoordinate?) {

        let weatherListVC = WeatherListAssembly(
            navigationController: navigationController,
            cityName: cityName,
            coordinates: coordinates
        ).create()
        navigationController.pushViewController(weatherListVC, animated: true)
    }

    private func showAppPreferences(completion: ((Bool) -> Void)? = nil) {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            assertionFailure("Invalid setting url")
            return
        }
        UIApplication.shared.open(settingsUrl, options: [:], completionHandler: completion)
    }
 }
