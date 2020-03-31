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
    @IBOutlet weak var blurView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showWeather.layer.cornerRadius = 20
        aboutButton.layer.cornerRadius = 20

        //createBlur()

      //  presenter.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func createBlur() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurView.frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.addSubview(blurEffectView)
    }

    @IBAction private func didTapWeatherListButton(_ sender: UIButton) {
        presenter.didTapWeatherListButton()
    }
}

 //Data Binding
extension StartupViewController {
    func bindData(with viewModel: StartupViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.title
        showWeather.setTitle(viewModel.firstButtonTitle, for: .normal)
        aboutButton.setTitle(viewModel.secondButtonTitle, for: .normal)
    }
}
