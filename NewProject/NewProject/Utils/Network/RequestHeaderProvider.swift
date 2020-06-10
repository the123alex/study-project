//
//  RequestHeaderProvider.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

protocol RequestHeaderProvider {
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String: String]
}

class JsonContentTypeHeaderProvider: RequestHeaderProvider {
    private let allowedMethods: Set<NetworkRequestPrototype.Method> = [.post, .put]

    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String: String] {
        guard allowedMethods.contains(requestPrototype.method) else {
            return [:]
        }

        return ["Content-Type": "application/json"]
    }
}

class WeatherHeaderProvider: RequestHeaderProvider {
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String: String] {
        [:]
    }
}
