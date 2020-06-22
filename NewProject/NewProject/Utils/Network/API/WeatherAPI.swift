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
        byCityName: String?,
        byCoordination: LocationCoordinate?,
        completion: @escaping (
        Result<WeatherResponseDTO, NetworkError>) -> Void
    )
}

class WeatherAPIMock: WeatherAPIProtocol {
    func loadWeather(
        byCityName: String?,
        byCoordination: LocationCoordinate?,
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
        byCityName: String?,
        byCoordination: LocationCoordinate?,
        completion: @escaping (
            Result<WeatherResponseDTO, NetworkError>
            ) -> Void
        ) {
        var params = [String: [String]]()
        if byCityName != nil {
            params = [
                "q": [byCityName ?? ""],
                "units": ["metric"],
                "lang": ["ru"],
                "appid": ["0e09e2d025867d8ce34fc90927b5c5a8"]
            ]
        } else if byCoordination != nil {
            //swiftlint:disable force_unwrapping
            params = [
                "lat": [(String(describing: byCoordination!.lat))],
                "lon": [(String(describing: byCoordination!.lon))],
                "units": ["metric"],
                "lang": ["ru"],
                "appid": ["0e09e2d025867d8ce34fc90927b5c5a8"]
            ]
        }

        let requestPrototype = NetworkRequestPrototype(
            method: .get,
            endpoint: .weather,
            path: "/data/2.5/forecast",
            headers: [:],
            queryParams: params
        )
        network.performRequest(
            requestPrototype,
            requestBuilder: requestBuilder,
            completion: completion
        )
    }
}
