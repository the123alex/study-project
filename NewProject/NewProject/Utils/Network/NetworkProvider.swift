//
//  NetworkProvider.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

struct NetworkResult {
    let data: Data
    let response: HTTPURLResponse
}

class NetworkProvider: Network {

    private let session: URLSession

    init() {
        self.session = URLSession.shared
    }

    //swiftlint:disable closure_body_length
    func performRequest(
        _ request: URLRequest,
        resultQueue: DispatchQueue,
        completion: @escaping (Result<NetworkResult, NetworkError>) -> Void
    ) {
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                let networkError: NetworkError
                if (error as NSError).code == -999 {
                    networkError = .cancelled
                } else {
                    networkError = .networkError(error)
                }

                resultQueue.async {
                    completion(.failure(networkError))
                }
                return
            }

            guard
                let data = data,
                let httpResponse = response as? HTTPURLResponse
            else {
                resultQueue.async {
                    completion(.failure(.unknown))
                }
                return
            }

            resultQueue.async {
                switch httpResponse.statusCode {
                case 200..<300:
                    //print(data.prettyPrintedJSONString)
                    completion(.success(NetworkResult(data: data, response: httpResponse)))
                default:
                    completion(.failure(.httpFailure(httpResponse.statusCode)))
                }
            }
        })
        task.resume()
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? { // NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
