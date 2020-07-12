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

    var cellModels: [PTableViewCellAnyModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

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
        tableView.separatorColor = .white
        tableView.backgroundColor = .white
        tableView.register(models: [WeatherListHeaderCellModel.self])

        tableView.register(
            WeatherListCodeCell.self,
            forCellReuseIdentifier: String(describing: WeatherListCodeCell.self)
        )
    }
}

extension WeatherListViewController {
    func showData(with cellModels: [PTableViewCellAnyModel]) {
        self.cellModels = cellModels
    }
}
extension WeatherListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withModel: cellModels[indexPath.row], for: indexPath)

        if let headerCell = cell as? WeatherListHeaderCell {
            headerCell.delegate = self
        }
        return cell
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension WeatherListViewController: WeatherListHeaderCellDelegate {
    func didTapMenuButton() {
        presenter.showCitySelect(weatherList: true)
    }
}
