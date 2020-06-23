//
//  WeatherListCodeCell.swift
//  NewProject
//
//  Created by Aleksey on 04.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
import SnapKit
import UIKit

class WeatherListCodeCell: UITableViewCell {

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()

    let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .right

        return label
    }()

    let temperatureValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .right

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubviews(
            dateLabel,
            weatherDescriptionLabel,
            temperatureValueLabel
        )

        backgroundColor = .white
        selectionStyle = .none
    }

    private func makeConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.trailing.greaterThanOrEqualTo(weatherDescriptionLabel.snp.leading).inset(-10)
            make.centerY.equalTo(weatherDescriptionLabel.snp.centerY)
        }

        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.trailing.equalTo(temperatureValueLabel.snp.leading).inset(-10)
            make.centerX.equalToSuperview()
        }

        temperatureValueLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(70)
            make.centerY.equalTo(weatherDescriptionLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
        }
    }
}
