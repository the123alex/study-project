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
    @IBOutlet weak var tableView: UITableView!

    var presenter: WeatherListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        setupViews()
        presenter.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: String(describing: WeatherListCell.self), bundle: Bundle.main),
            forCellReuseIdentifier: String(describing: WeatherListCell.self)
        )
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: WeatherListCell.self),
            for: indexPath
        ) as? WeatherListCell else {
            fatalError("Wrong identifier")
        }
        cell.cityImage.image = UIImage(named: "city")
        cell.temperatureToday.text = String(Int.random(in: 1...10))
        cell.temperatureTommorow.text = String(Int.random(in: 11...20))
        cell.temperatureAfterTommorow.text = String(Int.random(in: 21...100))
        return cell
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
