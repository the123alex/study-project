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
            WeatherListHeaderCell.self,
            forCellReuseIdentifier: String(describing: WeatherListHeaderCell.self)
        )
        tableView.register(
            WeatherListCodeCell.self,
            forCellReuseIdentifier: String(describing: WeatherListCodeCell.self)
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

        let randomTemp = Int.random(in: -30...30)
        let randomWet = Int.random(in: 0...100)

        if indexPath.row != 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: WeatherListCodeCell.self),
                for: indexPath
            ) as? WeatherListCodeCell else {
                fatalError("Wrong identifier")
            }
            cell.temperatureValueLabel.text = String(randomTemp) + "\u{00B0}"
            cell.dateLabel.text = "08.04"
            cell.wetDescriptionLabel.text = "Вероятность осадков"
            cell.wetValueLabel.text = String(randomWet) + "%"
            if randomTemp <= 0 {
                cell.iconImageView.image = UIImage(named: "cold")
            } else {
                cell.iconImageView.image = UIImage(named: "warm")
            }

        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: WeatherListHeaderCell.self),
                for: indexPath
                ) as? WeatherListHeaderCell else {
                    fatalError("Wrong identifier")
            }

            cell.dateLabel.text = "Сегодня"
            cell.iconImageView.image = UIImage(named: "warm")
            cell.temperatureValueLabel.text = "+ 23\u{00B0}"
            cell.weatherLabel.text = "Солнечно"
            cell.precipitationLabel.text = "Без осадков"

            return cell
        }
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
