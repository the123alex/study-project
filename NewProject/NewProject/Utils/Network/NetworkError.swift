//
//  NetworkError.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case networkError(Error)
    case unknown
    case invalidResponse(Error)
    case httpFailure(Int)
    case cancelled
}
