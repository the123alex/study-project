//
//  StartupAssembly.swift
//  NewProject
//
//  Created by Aleksey on 28.03.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

 class StartupAssembly {
    func  create() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
            identifier: "StartupViewController"
        ) as? StartupViewController else {
            preconditionFailure("Cannot create StartupViewController")
        }

        let navigationController = UINavigationController(rootViewController: viewController)
        let router = StartupRouter(navigationController: navigationController)
        let presenter = StartupPresenter(view: viewController, router: router)
        viewController.presenter = presenter

        return navigationController
    }
 }
