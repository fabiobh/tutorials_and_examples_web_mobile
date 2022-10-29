//
//  Model.swift
//  Domain
//
//  Created by fabiocunha on 25/09/22.
//

import Foundation

public protocol Model: Codable, Equatable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
