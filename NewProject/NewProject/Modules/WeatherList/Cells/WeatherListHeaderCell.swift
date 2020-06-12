//
//  WeatherListHeaderCell.swift
//  NewProject
//
//  Created by Aleksey on 08.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
import SnapKit
import UIKit

class WeatherListHeaderCell: UITableViewCell {

    let iconImageView = UIImageView()

    let currentCityDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black

        return label
    }()

    let currentCityButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.blue, for: .normal)

        return button
    }()

    let temperatureValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .gray

        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()

    let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    let currentCityStack: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal

        return stackView
    }()

    let imageTempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical

        return stackView
    }()

    let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
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
        contentView.addSubviews(
            currentCityStack,
            imageTempStackView,
            labelsStackView
        )
        currentCityStack.addArrangedSubview(currentCityDescription)
        currentCityStack.addArrangedSubview(currentCityButton)

        imageTempStackView.addArrangedSubview(iconImageView)
        imageTempStackView.addArrangedSubview(temperatureValueLabel)

        labelsStackView.addArrangedSubview(dateLabel)
        labelsStackView.addArrangedSubview(weatherLabel)
        labelsStackView.addArrangedSubview(precipitationLabel)

        backgroundColor = .white
        selectionStyle = .none
    }

    func makeConstraints() {
        currentCityStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalTo(imageTempStackView.snp.top).inset(-10)
            make.centerX.equalToSuperview()
        }

        imageTempStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }

        iconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }

        labelsStackView.snp.makeConstraints { make in
            make.leading.equalTo(imageTempStackView.snp.trailing).offset(30)
            make.centerY.equalTo(imageTempStackView.snp.centerY)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
