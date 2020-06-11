//
//  WeatherAPI.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

protocol WeatherAPIProtocol {
    func loadWeather(
        by cityName: String,
        completion: @escaping (
        Result<WeatherResponseDTO, NetworkError>) -> Void
    )
}

class WeatherAPIMock: WeatherAPIProtocol {
    func loadWeather(
        by cityName: String,
        completion: @escaping (
            Result<WeatherResponseDTO, NetworkError>
            ) -> Void
    ) {}
}

class WeatherAPI: WeatherAPIProtocol {
    private let network: Network
    private let requestBuilder: URLRequestBuilderProtocol

    init(
        network: Network,
        requestBuilder: URLRequestBuilderProtocol = URLRequestBuilder(headerProvider: WeatherHeaderProvider())
    ) {
        self.network = network
        self.requestBuilder = requestBuilder
    }

    func loadWeather(
        by cityName: String,
        completion: @escaping (
        Result<WeatherResponseDTO, NetworkError>
        ) -> Void
    ) {
        let requestPrototype = NetworkRequestPrototype(
            method: .get,
            endpoint: .weather,
            path: "/data/2.5/forecast",
            headers: [:],
            queryParams: [
                "q": [cityName],
                "units": ["metric"],
                "appid": ["0e09e2d025867d8ce34fc90927b5c5a8"]
            ]
        )
        network.performRequest(
            requestPrototype,
            requestBuilder: requestBuilder,
            completion: completion)
    }
}
