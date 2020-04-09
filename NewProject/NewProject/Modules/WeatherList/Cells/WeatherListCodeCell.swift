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
    let iconImageView = UIImageView()

    let temperatureValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .gray

        return label
    }()
    let wetValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .gray

        return label
    }()
    let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 10

        return stackView
    }()

    let wetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical

        return stackView
    }()

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
        contentView.addSubviews(
            dateLabel,
            imageStackView,
            wetStackView
            )

        imageStackView.addArrangedSubview(iconImageView)
        imageStackView.addArrangedSubview(temperatureValueLabel)

        wetStackView.addArrangedSubview(wetDescriptionLabel)
        wetStackView.addArrangedSubview(wetValueLabel)
    }

    private func makeConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.centerY.equalTo(imageStackView.snp.centerY)
           // make.trailing.equalTo(imageStackView.snp.leading).inset(10)
        }

        iconImageView.snp.makeConstraints { make in
        make.width.height.equalTo(60)
        }

        imageStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(dateLabel.snp.trailing).inset(-50)
        }

        wetStackView.snp.makeConstraints { make in
            make.leading.equalTo(imageStackView.snp.trailing).inset(-50)
            make.centerY.equalTo(imageStackView.snp.centerY)
        }
    }
}
