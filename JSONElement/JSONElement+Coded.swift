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
        let object = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)

        self = try .init(object)
    }

    func decoded<T: Decodable>(usingDecoder decoder: JSONDecoder) throws -> T {
        if let decoded = value as? T {
            return decoded
        }

        let data = try JSONSerialization.data(withJSONObject: self.value, options: .fragmentsAllowed)
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
