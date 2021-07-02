//
//  JSONElement+Equatable.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

extension JSONElement: Equatable {
    public static func == (lhsJson: JSONElement, rhsJson: JSONElement) -> Bool {
        switch (rhsJson, lhsJson) {
        case (.string(let lhs), .string(let rhs)):
            return lhs == rhs
        case (.bool(let lhs), .bool(let rhs)):
            return lhs == rhs
        case (.int(let lhs), .int(let rhs)):
            return lhs == rhs
        case (.double(let lhs), .double(let rhs)):
            return lhs == rhs
        case (.array(let lhs), .array(let rhs)):
            return lhs == rhs
        case (.dictionary(let lhs), .dictionary(let rhs)):
            return lhs == rhs
        case (.null, .null):
            return true
        default:
            return false
        }
    }
}
