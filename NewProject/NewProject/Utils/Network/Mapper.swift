//
//  Mapper.swift
//  NewProject
//
//  Created by Aleksey on 29.05.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype FromType: Decodable
    associatedtype ToType

    func map(from: FromType) throws -> ToType
}
