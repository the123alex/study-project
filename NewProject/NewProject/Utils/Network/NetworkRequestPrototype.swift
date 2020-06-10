//
//  NetworkRequestPrototype.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

struct NetworkRequestPrototype {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }

    enum APIEndpoint {
        case backend
        case weather
    }

    let method: Method
    let baseURL: URL
    let path: String
    var headers: [String: String]
    let queryParams: [String: [String]]
    let bodyData: Data?

    init(
        method: Method,
        endpoint: APIEndpoint,
        path: String,
        headers: [String: String],
        queryParams: [String: [String]],
        bodyData: Data? = nil
    ) {
        self.method = method
        self.path = path
        self.headers = headers
        self.queryParams = queryParams
        self.bodyData = bodyData

        switch endpoint {
        case .backend:
            self.baseURL = BaseURL.backendURL
        case .weather:
            self.baseURL = BaseURL.weatherURL
        }
    }
}

//swiftlint:disable force_unwrapping
private extension NetworkRequestPrototype {
    enum BaseURL {
         static let backendURL = URL(string: "https://yandex.ru")!
         static let weatherURL = URL(string: "http://api.openweathermap.org")!
    }
}
