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

    func showWeatherList () {
        let weatherListVC = WeatherListAssembly(navigationController: navigationController).create()
        navigationController.pushViewController(weatherListVC, animated: true)
    }
 }
