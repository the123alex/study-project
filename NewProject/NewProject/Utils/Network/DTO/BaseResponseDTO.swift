//
//  BaseResponseDTO.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let cod: String
    let message: Double
    let list: [T]
    let city: City
}

struct City: Decodable {
    let name: String
    let sunrise: Int
    let sunset: Int
}
