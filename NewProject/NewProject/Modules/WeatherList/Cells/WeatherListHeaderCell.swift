//
//  WeatherListHeaderCell.swift
//  NewProject
//
//  Created by Aleksey on 08.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable attributes

import SnapKit
import UIKit

class WeatherListHeaderCell: UITableViewCell {
    let test = WeatherListViewController()
    let helpView: UIView = {
        let view = UIView()

        return view
    }()

    let currentCityName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 45, weight: .light)
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignBaselines

        return label
    }()

    let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        label.textColor = .gray

        return label
    }()

    let iconImageView = UIImageView()

    var changeCityButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black

        let image = UIImage(systemName: Strings.SystemIconName.lineHorizontalThree)
        button.setBackgroundImage(image, for: .normal)

        return button
    }()

    let temperatureValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        label.textColor = .darkGray

        return label
    }()

    let tommorowDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .thin)
        label.textColor = .gray
        label.textAlignment = .center

        return label
    }()

    let tommorowTemperatureValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .thin)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        makeConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension WeatherListHeaderCell {
    func setupViews() {

        contentView.addSubview(helpView)

        helpView.addSubviews(
            currentCityName,
            changeCityButton,
            weatherDescriptionLabel,
            iconImageView,
            temperatureValueLabel,
            tommorowDescriptionLabel,
            tommorowTemperatureValueLabel
        )
        print(changeCityButton)
       // changeCityButton.addTarget(WeatherListPresenter.self, action: #selector(WeatherListPresenter.testTap(sender: )), for: .touchUpInside)

        backgroundColor = .white
        selectionStyle = .none
        separatorInset = .zero
    }

    func makeConstraints() {
        helpView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }

        currentCityName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.centerX.equalToSuperview()
            make.trailing.lessThanOrEqualTo(changeCityButton.snp.leading).inset(-10)
            make.bottom.equalTo(weatherDescriptionLabel.snp.top).inset(-3)
        }
        changeCityButton.snp.makeConstraints { make in
            make.height.width.equalTo(32)
            make.top.trailing.equalToSuperview().inset(25)
        }

        weatherDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(iconImageView.snp.top).inset(-10)
        }

        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(temperatureValueLabel.snp.top).inset(-10)
        }

        temperatureValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(tommorowDescriptionLabel.snp.top).inset(-40)
        }

        tommorowDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(tommorowTemperatureValueLabel.snp.top).inset(-5)
        }

        tommorowTemperatureValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }

    @objc func buttonAction(sender: UIButton) {
    }
}
