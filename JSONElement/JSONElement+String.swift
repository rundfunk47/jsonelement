//
//  JSONElement+String.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

public extension JSONElement {
    init(stringRepresentation: String) throws {
        let data = stringRepresentation.data(using: .utf8)!
        let object = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        try self.init(object)
    }

    var stringRepresentation: String {
        switch self {
        case .string(let string):
            return "\"" + string
                .replacingOccurrences(of: "\"", with: "\\\"")
                .replacingOccurrences(of: "/", with: "\\/")
                .replacingOccurrences(of: "\n", with: "\\n")
                .replacingOccurrences(of: "\u{8}", with: "\\b")
                .replacingOccurrences(of: "\u{12}", with: "\\f")
                .replacingOccurrences(of: "\r", with: "\\r")
                .replacingOccurrences(of: "\t", with: "\\t")
                + "\""
        case .bool(let bool):
            return bool ? "true" : "false"
        case .int(let int):
            return String(describing: int)
        case .double(let double):
            return String(describing: double)
        case .array(let array):
            return "[\(array.map { $0.stringRepresentation }.joined(separator: ","))]"
        case .dictionary(let dictionary):
            return "{\(dictionary.map { "\"\($0.key)\": \($0.value.stringRepresentation)" }.joined(separator: ","))}"
        case .null:
            return "null"
        }
        
        // Slower solution, here for completeness sake:
        /*
        let encoder = JSONEncoder()
        
        switch self {
        case .string(let string):
            return try! String(data: encoder.encode(string), encoding: .utf8)!
        case .bool(let bool):
            return try! String(data: encoder.encode(bool), encoding: .utf8)!
        case .int(let int):
            return try! String(data: encoder.encode(int), encoding: .utf8)!
        case .double(let double):
            return try! String(data: encoder.encode(double), encoding: .utf8)!
        case .array(let array):
            return try! String(data: encoder.encode(array.map { JSONElement($0) }), encoding: .utf8)!
        case .dictionary(let dictionary):
            return try! String(data: encoder.encode(dictionary.mapValues { JSONElement($0) }), encoding: .utf8)!
        case .null:
            return "null"
        }
        */
    }
}
