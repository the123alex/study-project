//
//  WeatherListPresenter.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

class WeatherListPresenter {

   private weak var view: WeatherListViewController?
   private let router: WeatherListRouter

   init(
       view: WeatherListViewController,
       router: WeatherListRouter
   ) {
       self.view = view
       self.router = router
   }

   func viewDidLoad() {
   }
}
