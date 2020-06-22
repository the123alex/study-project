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

    let helpView: UIView = {
        let view = UIView()
        //view.backgroundColor = .red

        return view
    }()

    let currentCityName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 45, weight: .light)
        label.textColor = .darkGray

        return label
    }()

    let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        label.textColor = .gray

        return label
    }()

    let iconImageView = UIImageView()

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

//        contentView.addSubview(currentCityName)
//        contentView.addSubview(weatherDescriptionLabel)
//        contentView.addSubview(iconImageView)
//        contentView.addSubview(temperatureValueLabel)
//        contentView.addSubview(tommorowDescriptionLabel)
//        contentView.addSubview(tommorowTemperatureValueLabel)

        contentView.addSubview(helpView)
        helpView.addSubview(currentCityName)
        helpView.addSubview(weatherDescriptionLabel)
        helpView.addSubview(iconImageView)
        helpView.addSubview(temperatureValueLabel)
        helpView.addSubview(tommorowDescriptionLabel)
        helpView.addSubview(tommorowTemperatureValueLabel)

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
            make.bottom.equalTo(weatherDescriptionLabel.snp.top).inset(-3)
        }

        weatherDescriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(iconImageView.snp.top).inset(-10)
        }

        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(temperatureValueLabel.snp.top).inset(-10)
          //  make.leading.trailing.equalToSuperview().inset(50)
           // make.width.greaterThanOrEqualToSuperview().inset(30)
            //make.height.greaterThanOrEqualTo(200)
//            make.width.equalTo(275)
           // make.height.equalTo(360)
            //make.height.lessThanOrEqualTo(400)
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
//swiftlint:disable implicitly_unwrapped_optional
    @objc func buttonAction(sender: UIButton!) {
         print("Button Clicked")
    }
}
