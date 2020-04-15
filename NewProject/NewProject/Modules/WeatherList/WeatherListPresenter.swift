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
    let weather = Weather(temperature: Float.random(in: -30 ... 40).rounded(), date: Date(), precipitationChance: 100)

    let cellModels: [PTableViewCellAnyModel] = [
        WeatherListHeaderCellModel(weather: weather)
    ]
    view?.showData(with: cellModels)
   }
}
