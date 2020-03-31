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

    init(
        view: StartupViewController,
        router: StartupRouter
    ) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {
    }

    func didTapWeatherListButton() {
    }
 }
