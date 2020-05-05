//
//  WeatherListHeaderCellModel.swift
//  NewProject
//
//  Created by Aleksey on 15.04.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func addSubviews(_ views: UIView...) -> UIView {
        views.forEach(addSubview)
        return self
    }
}
