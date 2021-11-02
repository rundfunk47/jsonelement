//
//  JSONElement+Coded.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

public extension JSONElement {
    init<T: Encodable>(encodable: T, usingEncoder encoder: JSONEncoder) throws {
        let data = try encoder.encode(encodable)
        try self.init(data: data)
    }

    init(data: Data) throws {
        let object = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)

        self = try .init(object)
    }

    func decoded<T: Decodable>(usingDecoder decoder: JSONDecoder) throws -> T {
        return try self.decoded(using: { try decoder.decode(T.self, from: $0) })
    }

    func decoded<T: Decodable>(using closure: (Data) throws -> T) throws -> T {
        if let decoded = value as? T {
            return decoded
        }

        let data = try JSONSerialization.data(withJSONObject: self.value, options: .fragmentsAllowed)
        
        return try closure(data)
    }
}
