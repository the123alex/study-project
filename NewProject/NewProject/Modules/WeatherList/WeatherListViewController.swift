//
//  WeatherListViewController.swift
//  NewProject
//
//  Created by Aleksey on 31.03.2020.
//Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

class WeatherListViewController: UIViewController {

    var presenter: WeatherListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view

       presenter.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
