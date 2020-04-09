//
//  WeatherListCodeCell.swift
//  NewProject
//
//  Created by Aleksey on 04.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

class WeatherListCodeCell: UITableViewCell {
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        return label
    }()

    let wetDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        return label
    }()

    let rainChanceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        return label
    }()

    let resultDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        return label
    }()

    lazy var temperatureLabel = self.makeGrayLabel()
    lazy var wetValue = self.makeGrayLabel()
    lazy var rainChanceValueLabel = self.makeGrayLabel()
    lazy var resultValueLabel = self.makeGrayLabel()

    private func makeGrayLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .lightGray
        return label
    }

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
        contentView.addSubview(dateLabel)
        contentView.addSubview(wetDescriptionLabel)
        contentView.addSubview(rainChanceDescriptionLabel)
        contentView.addSubview(resultDescriptionLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(wetValue)
        contentView.addSubview(rainChanceValueLabel)
        contentView.addSubview(resultValueLabel)
    }

    private func makeConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        wetDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        rainChanceDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        resultDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        wetValue.translatesAutoresizingMaskIntoConstraints = false
        rainChanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        resultValueLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 5),
            temperatureLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            temperatureLabel.trailingAnchor.constraint(greaterThanOrEqualTo: rainChanceDescriptionLabel.leadingAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            wetDescriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            wetDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            wetDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            wetValue.leadingAnchor.constraint(equalTo: wetDescriptionLabel.trailingAnchor, constant: 5),
            wetValue.centerYAnchor.constraint(equalTo: wetDescriptionLabel.centerYAnchor),
            wetValue.trailingAnchor.constraint(greaterThanOrEqualTo: resultValueLabel.leadingAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            rainChanceDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            rainChanceValueLabel.centerYAnchor.constraint(equalTo: rainChanceDescriptionLabel.centerYAnchor),
            rainChanceValueLabel.leadingAnchor.constraint(equalTo: rainChanceDescriptionLabel.trailingAnchor, constant: 5),
            rainChanceDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            resultDescriptionLabel.topAnchor.constraint(equalTo: rainChanceDescriptionLabel.bottomAnchor, constant: 16),
            resultDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            resultValueLabel.centerYAnchor.constraint(equalTo: resultDescriptionLabel.centerYAnchor),
            resultValueLabel.leadingAnchor.constraint(equalTo: resultDescriptionLabel.trailingAnchor, constant: 5),
            resultValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        dateLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        dateLabel.setContentHuggingPriority(.init(rawValue: 248), for: .vertical)

        temperatureLabel.setContentHuggingPriority(.init(rawValue: 248), for: .horizontal)
        temperatureLabel.setContentHuggingPriority(.init(rawValue: 252), for: .vertical)

        wetDescriptionLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        wetDescriptionLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        rainChanceValueLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        rainChanceValueLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)

        resultDescriptionLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        resultDescriptionLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        rainChanceValueLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        rainChanceValueLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}
