//
//  JSONElement+Codable.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

public enum JSONElementCodableError: LocalizedError {
    case decoding

    public var errorDescription: String? {
        switch self {
        case .decoding:
            return "Could not infer type for decoding"
        }
    }
}

extension JSONElement: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let decoded = try? container.decode(String.self) {
            self = .string(decoded)
        } else if let decoded = try? container.decode(Double.self) {
            self = .double(decoded)
        } else if let decoded = try? container.decode(Bool.self) {
            self = .bool(decoded)
        } else if let decoded = try? container.decode(Int.self) {
            self = .int(decoded)
        } else if let decoded = try? container.decode(Array<JSONElement>.self) {
            self = .array(decoded)
        } else if let decoded = try? container.decode(Dictionary<String, JSONElement>.self) {
            self = .dictionary(decoded)
        } else if container.decodeNil() == true {
            self = .null
        } else {
            throw JSONElementCodableError.decoding
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .string(let string):
            try container.encode(string)
        case .bool(let bool):
            try container.encode(bool)
        case .int(let int):
            try container.encode(int)
        case .double(let double):
            try container.encode(double)
        case .array(let array):
            try container.encode(array)
        case .dictionary(let dictionary):
            try container.encode(dictionary)
        case .null:
            try container.encodeNil()
        }
    }
}
