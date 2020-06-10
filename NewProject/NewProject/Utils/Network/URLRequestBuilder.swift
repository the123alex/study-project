//
//  URLRequestBuilder.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

protocol URLRequestBuilderProtocol {
    func buildRequest(for prototype: NetworkRequestPrototype) -> URLRequest
}

extension URLRequestBuilderProtocol {
    func prebuildRequest(for prototype: NetworkRequestPrototype) -> NSMutableURLRequest {
        var components = URLComponents()

        var queryItems: [URLQueryItem] = []

        for (queryKey, queryValue) in prototype.queryParams {
            for value in queryValue {
                let item = URLQueryItem(name: queryKey, value: value)
                queryItems.append(item)
            }
        }
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        let urlWithPath = prototype.baseURL.appendingPathComponent(prototype.path)

        guard let url = components.url(relativeTo: urlWithPath) else {
            fatalError("URLRequestBuilder: wrong url")
        }

        let request = NSMutableURLRequest(url: url)
        request.httpMethod = prototype.method.rawValue

        for (key, value) in prototype.headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        if let data = prototype.bodyData {
            request.httpBody = data
        }

        return request
    }
}

class URLRequestBuilder: URLRequestBuilderProtocol {
    let headerProvider: RequestHeaderProvider

    init(headerProvider: RequestHeaderProvider = JsonContentTypeHeaderProvider()) {
        self.headerProvider = headerProvider
    }

    func buildRequest(for prototype: NetworkRequestPrototype) -> URLRequest {
        var prototype = prototype
        let headersFromHeaderProvider = headerProvider.createHeaders(for: prototype)

        prototype.headers = prototype.headers.merging(
        headersFromHeaderProvider
        ) { current, _ ->
            String in
            current
        }

        return prebuildRequest(for: prototype) as URLRequest
    }
}
