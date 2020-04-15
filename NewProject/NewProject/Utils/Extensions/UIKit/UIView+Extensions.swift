//
//  UIView+Extensions.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 04.04.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func addSubviews(_ views: UIView...) -> UIView {
        views.forEach(addSubview)
        return self
    }
}
