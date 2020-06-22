//
//  ViewController.swift
//  NewProject
//
//  Created by Aleksey on 14.03.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

// swiftlint:disable implicitly_unwrapped_optional

class StartupViewController: UIViewController {

    var presenter: StartupPresenter!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var showWeather: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var sunView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
        showWeather.layer.cornerRadius = 20
        aboutButton.layer.cornerRadius = 20
        sunView.layer.cornerRadius = 35

        presenter.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @IBAction private func didTapWeatherListButton(_ sender: UIButton) {
        presenter.didTapWeatherListButton()
    }

    @IBAction private func didTapLocationButton(_ sender: UIButton) {
        presenter.didTapLocationButton()
    }
}

 //Data Binding
extension StartupViewController {
    func bindData(with viewModel: StartupViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        showWeather.setTitle(viewModel.firstButtonTitle, for: .normal)
        aboutButton.setTitle(viewModel.secondButtonTitle, for: .normal)
    }
}
